#!/bin/zsh
if [[ -n "$1" ]]; then
    setxkbmap $1
else
    layout=$(setxkbmap -query | grep "layout:" | tr -s ' ' | cut -d' ' -f2)
    case $layout in
        dk)
                setxkbmap us
            ;;
        us)
                setxkbmap dk
            ;;
        *)
                setxkbmap us
            ;;
    esac
fi
