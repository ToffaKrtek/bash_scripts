#!/bin/bash
wget -O - http://www.reddit.com/r/wallpaper |\
    grep -Eo 'http://i.imgur.com[^&]+jpg' |\
    shuf -n 1 |\
    xargs wget -O background.jpg
gsettings set org.gnome.desktop.background picture-uri "background.jpg"
