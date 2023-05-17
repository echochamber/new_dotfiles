
current_dir="$(dirname $( dirname -- "$0"; ))"
cd current_dir
. "${current_dir}/bash/bash_utils"

rsync -avz "${current_dir}/vscode/keybindings.json /home/jschein/.config/Code/keybindings.json
rsync -avz "${current_dir}/vscode/settings.json /home/jschein/.config/Code/settings.json
