#!/usr/bin/env bash

function ip(){
  ifconfig wlp0s20f3|grep inet|grep -v inet6|awk '{print $2}'
}
function ssid(){
  iwgetid -r
}
function date_format(){
  date +%Y-%m-%d
}
function running_time(){
  uptime|cut -d\, -f1
}
[[ "$1" ]] && $1 2> /dev/null || eval $(grep '^function' $0|awk '{print $2}'|cut -d\( -f1|fzf --prompt 'Select a Function: ')
