# My Dotfiles.

## Setup.sh

Does the following

1. Creates symlinks in $HOME/.${dotfilename} to that dotfile in this repo.
2. If a file with that name already exists either:
   * If the existing file is a symlink, leave it as is.
   * If the existing file is a real file, move it into `backup/` and then create a new symlink.


## Notes to self/to fix

1. Virtual env name stays in PS1 even after running deactivate or activating another venv
