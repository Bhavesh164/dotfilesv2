#!/usr/bin/env bash
file="$HOME/programs/bookmarks/snippet.txt"
# Prompt the user for the search string using dmenu
SEARCH_STRING=$(awk '{print i++ " " $0}' "$file" | dmenu -p "select bookmark:" -i -l 25 | cut -d " " -f2)
# Extract the line number from the output of grep
LINE_NUMBER=$(grep -n "$SEARCH_STRING" "$file" | awk -F: '{print $1}')
if [[ -n $LINE_NUMBER ]] && [[ "$LINE_NUMBER" == ?(-)+([[:digit:]]) ]]; then  
	sed -i -e "${LINE_NUMBER}d" "$file" 
else 
	notify-send "Please select URL"
fi
