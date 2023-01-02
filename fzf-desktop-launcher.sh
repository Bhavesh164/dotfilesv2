#!/bin/bash

# Use fzf to list all installed programs
programs=$(ls /usr/share/applications/ | grep '.desktop' | sed 's/.desktop//g' | fzf)

# Extract the executable path and name from the .desktop file
exec=$(grep -oP "^Exec=\K.*" "/usr/share/applications/$programs.desktop") # he "-o" flag of the "grep" command is used to show only the matching part of the output. The "-P" flag is used to enable Perl-style regular expressions.

# to use it in sxhkd
# ctrl + alt + p
# xterm -e "bash -c '/usr/local/bin/fzf-desktop-launcher.sh; exec bash'"

# Launch the selected program
nohup $exec &

# close xterm
pkill xterm

# The command "xterm -e" is used to open an xterm terminal window and run a command in it. The command that is run in the xterm window is specified after the "-e" flag.

# In this case, the command being run in the xterm window is:
#
# Copy code
# bash -c '/usr/local/bin/fzf-desktop-launcher.sh; exec bash'
# This command runs a Bash shell and executes the "fzf-desktop-launcher.sh" script, followed by the "exec" command to execute a new instance of Bash.
#
# The "fzf-desktop-launcher.sh" script is a shell script that uses the Fzf utility to search and launch applications from the desktop. When the script is run, it will open the Fzf interface in the xterm terminal window, allowing you to search for and select an application to launch.
#
# The "exec" command is used to replace the current shell process with a new process. In this case, it is used to start a new instance of Bash after the "fzf-desktop-launcher.sh" script has been run. This allows you to continue using the terminal after the script has finished running.
#
# Overall, this command opens an xterm terminal window and runs the "fzf-desktop-launcher.sh" script, which allows you to search and launch applications from the desktop. It then starts a new instance of Bash, so that you can continue using the terminal.





