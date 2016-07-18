#!/bin/bash

sudopacman sudo -S gnome
sudo systemctl enable gdm.service

#extra software, select what you want
# 6 7 10 13 32 35 37 42
sudo pacman -S gnome-extra

sudo pacman -S numix-themes
yaourt -S numix-circle-icon-theme-git


