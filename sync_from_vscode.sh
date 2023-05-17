
current_dir="$(realpath $( dirname -- "$0"; ))"
printf "$current_dir\n"
cd "${current_dir}"
. "${current_dir}/bash/bash_utils"

rsync -avz /home/jschein/.config/Code/User/keybindings.json "${current_dir}/vscode/keybindings.json"
rsync -avz /home/jschein/.config/Code/User/settings.json "${current_dir}/vscode/settings.json"
