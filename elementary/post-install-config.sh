#!/bin/bash

add-apt-repository ppa:philip.scott/elementary-tweaks
add-apt-repository ppa:numix/ppa
echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/arc-theme.list

apt-get update -y

apt-get install elementary-tweaks \
                numix-gtk-theme \
                numix-icon-theme-circle \ 
                arc-theme \
                ubuntu-restricted-extras \ 
                software-properties-common \
                gdebi \
                -y 
                