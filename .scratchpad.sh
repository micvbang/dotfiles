#!/bin/bash

WIDTH_PCT=75
HEIGHT_PCT=75

# get width of screen and height of screen
SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')

# new width and height (in characters for terminal)
W=$(( ($SCREEN_WIDTH / 100 * $WIDTH_PCT) / 10 ))
H=$(( ($SCREEN_HEIGHT / 100 * $HEIGHT_PCT) / 20 ))

# Calculate pixel dimensions and center position
PIXEL_W=$(( $SCREEN_WIDTH / 100 * $WIDTH_PCT ))
PIXEL_H=$(( $SCREEN_HEIGHT / 100 * $HEIGHT_PCT ))
X=$(( ($SCREEN_WIDTH - $PIXEL_W) / 2 ))
Y=$(( ($SCREEN_HEIGHT - $PIXEL_H) / 2 ))

ghostty --window-width="$W" --window-height="$H" -e sh -c "tmux attach -dt scratchpad || tmux new -s scratchpad" &
