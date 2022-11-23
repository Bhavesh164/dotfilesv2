#!/bin/bash
config_dir="$HOME/.config/examples"
config_file="$config_dir/login.conf"

mkdir -p "$config_dir" || exit 1

function create_config(){
  read -p "User Name: " user
  read -s -p "Password: " password
  echo
  read -p "Server Address: " server
  read -p "Port: " port
  read -p "Message: " msg

  echo "
  user='$user'
  password='$password'
  server='$server'
  port='$port'
  msg='$msg'
  " > "$config_file"
}

[[ -f "$config_file" ]] ||  create_config
source "$config_file"

[[ $user ]] || create_config
[[ $password ]] || create_config
[[ $server ]] || create_config
[[ $port ]] || create_config
[[ $msg ]] || create_config

wget -qO- --user "$user" --password "$password" "http://$server:$port/?msg=$msg" || echo fail
