#!/usr/bin/env bash
# Switch the dev server (top pane of tmux "server" window) to a given worktree.
# Usage: dev/tmux-dev-server.sh [--dry-run] [worktree-dir]
#   worktree-dir defaults to $PWD

set -euo pipefail

dry_run=false
dir=""
source_pane=""
for arg in "$@"; do
  case "$arg" in
    --dry-run) dry_run=true ;;
    --pane) shift_next=pane ;;
    *)
      if [[ "${shift_next:-}" == "pane" ]]; then
        source_pane="$arg"
        shift_next=""
      else
        dir="$arg"
      fi
      ;;
  esac
done

# Prefer @claude-cwd (set by bauble/worktree hooks) over the pane's shell cwd,
# since Claude Code's EnterWorktree changes its internal cwd without changing
# the shell process's cwd.
if [[ -n "$source_pane" ]]; then
  claude_cwd=$(tmux show-option -p -t "$source_pane" -qv @claude-cwd 2>/dev/null) || true
  if [[ -n "${claude_cwd:-}" && -d "$claude_cwd" ]]; then
    dir="$claude_cwd"
  fi
fi
dir="${dir:-$PWD}"

if [[ ! -d "$dir" ]]; then
  echo "error: directory does not exist: $dir" >&2
  exit 1
fi

# Find the tmux window named "server" in the current session
session="$(tmux display-message -p '#{session_name}' 2>/dev/null)" || {
  echo "error: not inside a tmux session" >&2
  exit 1
}

window_id="$(tmux list-windows -t "$session" -F '#{window_name} #{window_id}' \
  | awk '$1 == "server" { print $2; exit }')"

if [[ -z "$window_id" ]]; then
  echo "error: no tmux window named 'server' in session '$session'" >&2
  exit 1
fi

# Find the topmost pane (lowest pane_top value)
pane_id="$(tmux list-panes -t "$window_id" -F '#{pane_top} #{pane_id}' \
  | sort -n | head -1 | awk '{ print $2 }')"

if [[ -z "$pane_id" ]]; then
  echo "error: no panes found in window '$window_id'" >&2
  exit 1
fi

cmd="cd $dir && rm -rf node_modules/.vite && pnpm dev"

if $dry_run; then
  echo "session:  $session"
  echo "window:   $window_id"
  echo "pane:     $pane_id"
  echo "command:  $cmd"
  exit 0
fi

# Send Ctrl-C to kill the running dev server, then the restart command
tmux send-keys -t "$pane_id" C-c
sleep 0.3
tmux send-keys -t "$pane_id" "$cmd" Enter

echo "Sent dev server restart to pane $pane_id → $dir"
