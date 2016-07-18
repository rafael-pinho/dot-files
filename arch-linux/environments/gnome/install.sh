#!/bin/bash

# 2 13 15 17 18 19 20 21 22 23 24 25 26 40 41 46
sudopacman sudo -S gnome
sudo systemctl enable gdm.service

#extra software, select what you want
# 6 7 10 13 32 35 37 42
sudo pacman -S gnome-extra

sudo pacman -S numix-themes
yaourt -S numix-circle-icon-theme-git


