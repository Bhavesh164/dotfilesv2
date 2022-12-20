#!/usr/bin/env bash 
# bookmark="$(xclip -o)"
bookmark="$(xclip -selection clipboard -o)"
file="$HOME/programs/bookmarks/snippet.txt"
if grep -q "^$bookmark$" "$file"; then # -q flag is for silent grep. Grep does not output anything
	notify-send "Oops. " "Already bookmarked!"
else 
	regex='(https?|ftp|file)://[-[:alnum:]\+&@#/%?=~_|!:,.;]+'
	if [[ $bookmark =~ $regex ]]; then # =~ is regular expression comparison
		notify-send "bookmark added" "$bookmark saved to a file"
		echo "$bookmark" >> "$file"
	else 
		notify-send "Not a valid url" 
	fi
fi
