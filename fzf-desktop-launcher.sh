#!/usr/bin/env bash
# Find all desktop files in the current directory
desktop_files=$(find /usr/share/applications -name "*.desktop")

# to use it in sxhkd
# ctrl + alt + p
# xterm -e "bash -c '/usr/local/bin/fzf-desktop-launcher.sh; exec bash'"
# alacritty -e '/usr/local/bin/fzf-desktop-launcher.sh'

# Use fzf to select multiple desktop files
selected_files=$(echo "$desktop_files" | fzf --multi --bind 'ctrl-l:clear-query')

# Launch the selected desktop files
while read -r file; do
	nohup $(grep 'Exec=' "$file" | sed 's/Exec=//') > /tmp/output.log 2>&1 &
done <<< "$selected_files"

pkill alacritty
