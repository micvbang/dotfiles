if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

redshift -l -55.7:12.6 -t 5500:3600 -m vidmode &
