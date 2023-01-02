#!/bin/bash

# Use Fzf to select an option
option=$(printf "Logout\nShutdown\nReboot\nLock" | fzf)

# Process the selected option
case "$option" in
    Logout)
        # Logout of the system
        gnome-session-quit --logout
        ;;
    Shutdown)
        # Shutdown the system
        systemctl poweroff
        ;;
    Reboot)
        # Reboot the system
        systemctl reboot
        ;;
    Lock)
        # lock the system
		xdotool key Super_L+l
        ;;
esac
