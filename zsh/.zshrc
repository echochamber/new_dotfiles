# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Let powerlevel10k handle venv display instead of the default (venv) prefix.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump)

source "$ZSH"/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/nvm_completion" ] && \. "$NVM_DIR/nvm_completion"  # This loads nvm bash_completion

[[ ! -f ~/.zsh_aliases ]] || source ~/.zsh_aliases

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


export PNPM_HOME="/Users/jschein/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

alias sqf="sqlfluff fix "
export PATH="/opt/homebrew/bin:$PATH"

autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
alias vim="nvim"

export PATH="$HOME/.local/bin:$HOME/.claude/scripts:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jschein/Code/manapool/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jschein/Code/manapool/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jschein/Code/manapool/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jschein/Code/manapool/google-cloud-sdk/completion.zsh.inc'; fi

# =============================================================================
# Git Worktree Functions
# =============================================================================

# Create a new git worktree as a sibling directory
# Usage: wt-add <branch-name> [base-branch]
wt-add() {
  if [ -z "$1" ]; then
    echo "Usage: wt-add <branch-name> [base-branch]"
    return 1
  fi

  local branch="$1"
  local base="${2:-dev}"
  local repo_root=$(git rev-parse --show-toplevel)
  local repo_name=$(basename "$repo_root")
  local safe_branch=$(echo "$branch" | tr '/' '-')
  local worktree_path="$(dirname "$repo_root")/${repo_name}-${safe_branch}"

  git worktree add -b "$branch" "$worktree_path" "$base"

  # Symlink Claude Code local config files if any exist
  local claude_files=(settings.local.json CLAUDE.local.md hook-config.local.json)
  local linked_claude=0
  for f in "${claude_files[@]}"; do
    if [ -f "$repo_root/.claude/$f" ]; then
      mkdir -p "$worktree_path/.claude"
      ln -sf "$repo_root/.claude/$f" "$worktree_path/.claude/$f"
      linked_claude=1
    fi
  done
  [ "$linked_claude" -eq 1 ] && echo "Linked Claude Code local config"

  # Symlink .env if it exists (but not variants like .env.local, local.env, etc.)
  if [ -f "$repo_root/.env" ]; then
    ln -sf "$repo_root/.env" "$worktree_path/.env"
    echo "Linked .env"
  fi

  # Create beads redirect file for shared task tracking (beads native approach)
  if [ -d "$repo_root/.beads" ]; then
    mkdir -p "$worktree_path/.beads"
    echo "../${repo_name}/.beads" > "$worktree_path/.beads/redirect"
    echo "Created beads redirect"
  fi

  # Symlink .vercel directory if it exists (for Vercel CLI project linking)
  if [ -d "$repo_root/.vercel" ]; then
    ln -sf "$repo_root/.vercel" "$worktree_path/.vercel"
    echo "Linked .vercel"
  fi

  echo ""
  echo "Worktree created at: $worktree_path"
  echo "To open in VSCode: code $worktree_path"
}

# Create a worktree for an existing branch
# Usage: wt-open <branch-name>
wt-open() {
  if [ -z "$1" ]; then
    echo "Usage: wt-open <branch-name>"
    return 1
  fi

  local branch="$1"
  local repo_root=$(git rev-parse --show-toplevel)
  local repo_name=$(basename "$repo_root")
  local safe_branch=$(echo "$branch" | tr '/' '-')
  local worktree_path="$(dirname "$repo_root")/${repo_name}-${safe_branch}"

  git worktree add "$worktree_path" "$branch"

  # Symlink Claude Code local config files if any exist
  local claude_files=(settings.local.json CLAUDE.local.md hook-config.local.json)
  local linked_claude=0
  for f in "${claude_files[@]}"; do
    if [ -f "$repo_root/.claude/$f" ]; then
      mkdir -p "$worktree_path/.claude"
      ln -sf "$repo_root/.claude/$f" "$worktree_path/.claude/$f"
      linked_claude=1
    fi
  done
  [ "$linked_claude" -eq 1 ] && echo "Linked Claude Code local config"

  # Symlink .env if it exists (but not variants like .env.local, local.env, etc.)
  if [ -f "$repo_root/.env" ]; then
    ln -sf "$repo_root/.env" "$worktree_path/.env"
    echo "Linked .env"
  fi

  # Create beads redirect file for shared task tracking (beads native approach)
  if [ -d "$repo_root/.beads" ]; then
    mkdir -p "$worktree_path/.beads"
    echo "../${repo_name}/.beads" > "$worktree_path/.beads/redirect"
    echo "Created beads redirect"
  fi

  # Symlink .vercel directory if it exists (for Vercel CLI project linking)
  if [ -d "$repo_root/.vercel" ]; then
    ln -sf "$repo_root/.vercel" "$worktree_path/.vercel"
    echo "Linked .vercel"
  fi

  echo ""
  echo "Worktree created at: $worktree_path"
  echo "To open in VSCode: code $worktree_path"
}

# List all worktrees for the current repo
wt-list() {
  git worktree list
}

# Remove a worktree by branch name
# Usage: wt-remove [-f] <branch-name>
wt-remove() {
  local force=""
  if [ "$1" = "-f" ]; then
    force="--force"
    shift
  fi

  if [ -z "$1" ]; then
    echo "Usage: wt-remove [-f] <branch-name>"
    return 1
  fi

  local branch="$1"
  local repo_root=$(git rev-parse --show-toplevel)
  local repo_name=$(basename "$repo_root")
  local safe_branch=$(echo "$branch" | tr '/' '-')
  local worktree_path="$(dirname "$repo_root")/${repo_name}-${safe_branch}"

  if git worktree remove $force "$worktree_path"; then
    echo "Worktree removed: $worktree_path"
  else
    echo "Failed to remove worktree. Use -f to force removal."
    return 1
  fi
}

# Change directory to a worktree by branch name
# Usage: wt-cd <branch-name>
wt-cd() {
  if [ -z "$1" ]; then
    echo "Usage: wt-cd <branch-name>"
    return 1
  fi

  local branch="$1"
  local repo_root=$(git rev-parse --show-toplevel)
  local repo_name=$(basename "$repo_root")
  local safe_branch=$(echo "$branch" | tr '/' '-')
  local worktree_path="$(dirname "$repo_root")/${repo_name}-${safe_branch}"

  cd "$worktree_path" || return
}


# =============================================================================
# AI Tasks Functions
# =============================================================================

# Set BEADS_DIR only inside manapool repos; unset elsewhere so bd uses local .beads/
_update_beads_dir() {
  case "$PWD" in
    /Users/jschein/Code/manapool/*)
      export BEADS_DIR=/Users/jschein/Code/manapool/manapool/.beads
      ;;
    *)
      unset BEADS_DIR
      ;;
  esac
}
add-zsh-hook chpwd _update_beads_dir
_update_beads_dir

export PATH="$HOME/Code/ClaudeUtils/linear-sync/bin:$PATH"
