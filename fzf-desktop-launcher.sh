#!/bin/bash

# Use fzf to list all installed programs
programs=$(ls /usr/share/applications/ | grep '.desktop' | sed 's/.desktop//g' | fzf)

# Extract the executable path and name from the .desktop file
exec=$(grep -oP "^Exec=\K.*" "/usr/share/applications/$programs.desktop")

# to use it in sxhkd
# ctrl + alt + p
# xterm -e "bash -c '/usr/local/bin/fzf-desktop-launcher.sh; exec bash'"
# fzf --multi --print0 ( This will use null characters to separate the selected files, allowing you to delete files with names that contain spaces or special characters.)

# Launch the selected program
nohup $exec &

# close xterm
pkill xterm
