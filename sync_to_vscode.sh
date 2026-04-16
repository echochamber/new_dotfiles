#! /bin/bash
current_dir="$(realpath "$( dirname -- "$0"; )")"
printf '%s\n' "$current_dir"
cd "${current_dir}" || exit
bash_utils_path="${current_dir}/bash/bash_utils"
# shellcheck source=bash/bash_utils
# shellcheck disable=SC1091
source "$bash_utils_path"

vscode_path=$(get_vscode_path)
rsync -avz "${current_dir}/vscode/keybindings.json" "${vscode_path}/keybindings.json"
rsync -avz "${current_dir}/vscode/settings.json" "${vscode_path}/settings.json"