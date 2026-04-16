#! /bin/bash
current_dir="$(realpath "$( dirname -- "$0"; )")"
printf '%s\n' "$current_dir"
cd "${current_dir}" || exit
bash_utils_path="${current_dir}/bash/bash_utils"
# shellcheck source=bash/bash_utils
# shellcheck disable=SC1091
source "$bash_utils_path"

vscode_path=$(get_vscode_path)

rsync -avz "${vscode_path}/keybindings.json" "${current_dir}/vscode/keybindings.json"
rsync -avz "${vscode_path}/settings.json" "${current_dir}/vscode/settings.json"
