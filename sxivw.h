#!/usr/bin/env bash
# set wallpaper using sxiv 
sxiv -r -q -o * | xargs -I {} gsettings set org.gnome.desktop.background picture-uri "$PWD/{}"
# to set wallpaper press the m key
