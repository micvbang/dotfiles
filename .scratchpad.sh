#!/bin/bash

WIDTH_PCT=90
HEIGHT_PCT=90

# get width of screen and height of screen
SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')

# new width and height
W=$(( ($SCREEN_WIDTH / 100 * $WIDTH_PCT) / 11 ))
H=$(( ($SCREEN_HEIGHT / 100 * $HEIGHT_PCT)  / 22))
X=$(( $SCREEN_WIDTH / 100 * (100 - $WIDTH_PCT) ))
Y=$(( $SCREEN_HEIGHT / 100 * (100 - $HEIGHT_PCT) ))

gnome-terminal --geometry $(printf "%sx%s+%s+%s" "$W" "$H" "$X" "$Y")  -- sh -c "tmux attach -dt scratchpad || tmux new -s scratchpad"
# wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H
