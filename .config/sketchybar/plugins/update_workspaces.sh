#!/bin/bash

# Get the focused workspace from AeroSpace
FOCUSED="$AEROSPACE_FOCUSED_WORKSPACE"

# Iterate through workspaces 1-7
for i in {1..7}; do
  if [[  " $i " -eq "$FOCUSED" ]]; then
    # Highlight the focused workspace
    sketchybar --set space.$i background.color=0xff555555 \
              --set space.$i label.color=0xffffffff
  else
    # Reset other workspaces
    sketchybar --set space.$i background.color=0xff1e1e1e \
              --set space.$i label.color=0xff888888
  fi
done

