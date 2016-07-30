#!/bin/bash

function text_editor_install(){
	echo "Select one text editor to install"
	echo "1- gedit"
	echo "2- atom"
	echo "3- visual studio code"
	read TEXT_EDITOR

	case $TEXT_EDITOR in
		1)
	    sudo pacman -S gedit
	    ;;
	  2)
	    yaourt -S atom
	    ;;
	  3)
	    yaourt -S visual-studio-code
	    ;;
	esac
	
	echo "Press any key to continue..."
	read
}

function browser_install(){
	echo "Select one browser to install"
	echo "1- Opera"
	echo "2- Firefox"
	echo "3- Google-Chrome"
	read BROWSER

	case $BROWSER in
	  1)
	    sudo pacman -S opera
	    yaourt -S chromium-pepper-flash
	    ;;
	  2)
	    sudo pacman -S firefox
	    ;;
	  3)
	    yaourt -S google-chrome
	    ;;
	esac
		
	echo "Press any key to continue..."
	read
}

function file_manager_install(){
  echo "Select one file manager to install"
  echo "1- Ranger"
  echo "2- Nautilus"
  read FILE_MANAGER

  case $FILE_MANAGER in
  	1)
	    sudo pacman -S ranger
	    ;;
  	2)
	    sudo pacman -S nautilus
	    ;;
	esac
		
	echo "Press any key to continue..."
	read
}

function music_players_install(){
  echo "Select one music player to install"
	echo "1- Spotify"
	echo "2- Playerctl - for multimedia keys support"
	read MUSIC_PLAYER

  case $MUSIC_PLAYER in
	  1)
	    yaourt -S spotify
	    ;;
	  2)
	    yaourt -S playerctl
	    ;;
	esac

	echo "Press any key to continue..."
	read
}

function wallpaper_manager_install(){
	echo "Select one wallpaper manager to install"
	echo "1- Feh"
	echo "2- Nitrogen"
	read WALLPAPER_MANAGER
  
	case $WALLPAPER_MANAGER in
	  1)
	    sudo pacman -S feh
	    ;;
	  2)
	    sudo pacman -S nitrogen
	    ;;
	esac
		
	echo "Press any key to continue..."
	read
}

function ssh_client_install(){
  sudo pacman -S openssh
  
	echo "Press any key to continue..."
	read
}

function nvm_install(){
	yaourt -S nvm-git
		
	echo "Press any key to continue..."
	read
}

function docker_install(){
	sudo pacman -S docker
	systemctl enable docker
	curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/dc
	chmod +x /usr/local/bin/dc
		
	echo "Press any key to continue..."
	read
}

while [ "$USER_INPUT" != ":quit" ]; do

clear
printf "\n\n"
echo "///////////////////////////////////////////////////////////////////////"
echo "///////////////////   ARCH LINUX PROGRAMS INSTALL   ///////////////////"
echo "///////////////////////////////////////////////////////////////////////" 
printf "\n\n"
echo "THIS SCRIPT USES YAOURT AND CANNOT BE EXECUTED AS ROOT. PLEASE, IF YOU "
echo "RUN THIS SCRIPT AS ROOT EXIT AND RUN WITH OTHER USER ACCOUNT."
echo "choose what you want to install"
printf "\n"
echo "1 ............... text editors"
echo "2 ............... browser"
echo "3 ............... file managers"
echo "4 ............... music player"
echo "5 ............... wallpaper managers"
echo "6 ............... ssh client"
echo "7 ............... nvm - npm - nodejs"
echo "8 ............... docker - docker-compose"
printf "\n\n:quit - EXIT\n\n"
read USER_INPUT

case $USER_INPUT in
    1)
      text_editor_install
    ;;
    2)
      browser_install
    ;;
    3)
      file_manager_install
    ;;
    4)
      music_players_install
    ;;
    5)
      wallpaper_manager_install
    ;;
    6)
      ssh_client_install
    ;;
    7)
      nvm_install
    ;;
    8)
      docker_install
    ;;
esac

done
