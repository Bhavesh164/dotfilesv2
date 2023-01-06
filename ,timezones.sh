

#!/bin/bash
set -eo pipefail

if [[ "$1" != "" ]]; then
  time=$1
else
  time=''
fi

function printDate() {
  if [[ "$time" != "" ]]; then
    printf '%-9s %s \n' "$1:" "$(TZ=$2 date +'%a, %d %b %H:%M' --date $time\ $(date +%Z))"
  else
    printf '%-9s %s \n' "$1:" "$(TZ=$2 date +'%a, %d %b %H:%M')"
  fi
}

printDate "Los Ang." America/Los_Angeles
printDate "New York" America/New_York
printDate "London" Europe/London
printDate "Berlin" Europe/Berlin
printDate "Moscow" Europe/Moscow 
printDate "Bangkok" Asia/Bangkok
printDate "Tokyo" Asia/Tokyo
printDate "India" Asia/Kolkata
printDate "Australia" Australia/Melbourne
