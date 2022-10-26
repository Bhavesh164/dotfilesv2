#!/usr/bin/env bash

choice=$(git branch 2> /dev/null | fzf)
if [[ ! -z "$choice" ]]; then
	eval git checkout $choice;
else
	echo "Program terminated." && exit 1
fi

