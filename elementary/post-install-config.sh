#!/bin/bash

#update system
apt-get update
apt-get upgrade -y


#install some util packages
apt-get install software-properties-common \
                gdebi \
                ubuntu-restricted-extras


#add elementary tweaks, numix and arc theme repositories
add-apt-repository ppa:philip.scott/elementary-tweaks
add-apt-repository ppa:numix/ppa

wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
apt-key add - < Release.key
apt-get update
echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list

apt-get update -y


#install tweaks, numix and arch themes
apt-get install elementary-tweaks \
                numix-gtk-theme \
                numix-icon-theme-circle \ 
                arc-theme \
                -y 
                
