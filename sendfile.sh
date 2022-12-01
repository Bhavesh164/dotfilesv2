#!/usr/bin/env bash

file=$(find $HOME/Downloads -type f | dmenu -i -l 25) # l is for long listing
echo $file;
if [ -z "$file" ]; then 
	echo "please select a file";exit;
fi
curl -F "file=@$file" 0x0.st | xclip -sel c
notify-send 'url copied in 0x0.st'
