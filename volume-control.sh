#!/bin/bash

# Set the volume increment/decrement amount
increment=5

# Bind the keys to the actions
echo "Press '+' to increase the volume, '-' to decrease the volume, 'm' to mute/unmute the volume, and 'q' to quit."
while read -rn1 key; do
  if [ "$key" = "+" ]; then
    amixer set Master "$increment%+"
  elif [ "$key" = "-" ]; then
    amixer set Master "$increment%-"
  elif [ "$key" = "m" ]; then
	amixer set Master toggle
	amixer set Headphone toggle
	amixer set Speaker toggle
  elif [ "$key" = "q" ]; then
    break
  fi
done < /dev/stdin
