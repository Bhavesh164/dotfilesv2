#!/usr/bin/env bash 
# bookmark="$(xclip -o)"
bookmark="$(xclip -selection clipboard -o)"
file="$HOME/programs/bookmarks/snippet.txt"
if grep -q "^$bookmark$" "$file"; then
	notify-send "Oops. " "Already bookmarked!"
else 
	regex='(https?|ftp|file)://[-[:alnum:]\+&@#/%?=~_|!:,.;]+'
	if [[ $bookmark =~ $regex ]]; then
		notify-send "bookmark added" "$bookmark saved to a file"
		echo "$bookmark" >> "$file"
	else 
		notify-send "Not a valid url" 
	fi
fi
