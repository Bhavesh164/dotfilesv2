#!/bin/bash

# add all modified and deleted files
git add -A

# commit changes with a message passed as a command line argument
git commit -m "$*"

# check if the "origin" remote is configured
if git remote | grep -q "origin"; then
  # push changes to the "origin" remote
  git push
else
  # display an error message
  echo "Error: No remote 'origin' configured."
fi
