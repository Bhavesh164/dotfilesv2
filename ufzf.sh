#!/usr/bin/env bash

list=$(ls /usr/local/bin | grep -v ufzf.sh | fzf)
read -p "Do you want to run the script with command line arguments: " response

if [ "$response" != "y" ]; then
  	$list 
fi


if [ "$response" == "y" ]; then
	read -p "How many command line arguments are there: " response
	if [ "$response" -eq 3 ]; then
		read -p "First:" first
		read -p "Second:" second
		read -p "Third:" third
		$list "$first" "$second" "$third"
	fi
	if [ "$response" -eq 2 ]; then
		read -p "First:" first
		read -p "Second:" second
		$list "$first" "$second"
	fi
	if [ "$response" -eq 1 ]; then
		read -p "First:" first
		$list "$first" 
	fi
	if [ "$response" -gt 3 ]; then
 		echo -e "\033[31mError: No. of arguments exceeds 3" # `\033[31m` this will print the message in red color
	fi
fi
