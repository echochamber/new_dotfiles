current_dir="$(realpath $( dirname -- "$0"; ))"
backup_dir="${current_dir}/backup"

. "${current_dir}/bash/bash_utils"


sync_dotfiles_dir() {
  syncdir="$1"
  sync_backup="$backup_dir/$(echo "$syncdir" | sed -e "s@^$current_dir/@@g" -e "s@\*@@g" -e "s@/\$@@g")"
  mkdir -p $sync_backup
  for f in $1
  do
    basen="$(basename $f)"
    dirn="$(dirname $f)"
    if [ -L "$HOME/.$basen" ]; then
      echo "$(f_warn "Skipping Existing Symlink") ${dirn}/$(f_em $basen)"
      continue
    fi
    if [ -f "$HOME/.$basen" ]; then
      echo "$(f_warn Moving) $HOME/.$basen to backup dir at $backup_dir"
      mv $HOME/.$basen $sync_backup/.$basen
    fi
    echo "$(f_info Linking) ${dirn}/$(f_em $basen) to $HOME/.$basen"
    # take action on each file. $f store current file name
    ln -s $f $HOME/.$basen
  done
}
sync_dotfiles_dir "$HOME/jschein_dotfiles/bash/*"
sync_dotfiles_dir "$HOME/jschein_dotfiles/misc/*"
