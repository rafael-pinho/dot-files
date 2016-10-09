#!/bin/bash

#update system
apt-get update
apt-get upgrade -y


#install some util packages
apt-get install software-properties-common \
                gdebi \
                ubuntu-restricted-extras \
                -y


#add elementary tweaks, numix and arc theme repositories
add-apt-repository ppa:philip.scott/elementary-tweaks
add-apt-repository ppa:numix/ppa

wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
apt-key add - < Release.key
apt-get update
echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list


#add spotify repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list


#install tweaks, numix, arch themes and spotify
apt-get update
apt-get install elementary-tweaks \
                numix-gtk-theme \
                numix-icon-theme-circle \ 
                arc-theme \
                spotify-client \
                -y 
                
