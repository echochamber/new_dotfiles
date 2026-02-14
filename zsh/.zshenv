. "$HOME/.cargo/env"

# Set BEADS_DIR only inside manapool repos; unset elsewhere so bd uses local .beads/
case "$PWD" in
  /Users/jschein/Code/manapool/*)
    export BEADS_DIR=/Users/jschein/Code/manapool/manapool/.beads
    ;;
esac

