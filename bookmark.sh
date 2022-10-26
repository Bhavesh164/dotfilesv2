#!/usr/bin/env bash

BROWSER='google-chrome'

declare -a options=(
"demo_admin - https://demo.aed365.com/aed365s/"
"demo_reseller - https://54.226.246.232/aed365-reseller/"
"demo_web - https://demo.aed365.com/aed365-web/user-management"
"quit"
)

choice=$(printf '%s\n' "${options[@]}" | fzf )

if [[ "$choice" == quit ]]; then
	echo "Program terminated." && exit 1
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$BROWSER "$cfg"
else
	echo "Program terminated." && exit 1
fi

