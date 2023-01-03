#!/usr/bin/env bash
file="$HOME/programs/bookmarks/snippet.txt"
bookmark=$(awk '{print i++ " " $0}' "$file" | dmenu -p "select bookmark:" -i -l 25 | cut -d " " -f2)
regex='(https?|ftp|file)://[-[:alnum:]\+&@#/%?=~_|!:,.;]+'
# Use a regular expression to check if the variable is a URL
if [[ $bookmark =~ $regex ]]; then
	# The variable is a URL
	google-chrome --new-tab --incognito "$bookmark"
elif [ -z $bookmark ]; then
  	notify-send "Please select a url"
else
  	# The variable is not a URL
  	notify-send "$bookmark is not a URL"
fi
