#!/bin/bash

sudo pacman -S i3-wm i3lock i3status dmenu
yaourt -S i3blocks

echo \#\!\/bin\/bash > temp
sed "s/\#\!\/bin\/bash/exec i3/g" /etc/X11/xinit/xinitrc >> temp
cat temp > /etc/X11/xinit/xinitrc
rm temp
