#!/bin/bash

function ws(){
	printf "$1\n"
}

function config_pacman(){
	ws "refreshing keys..."
	pacman-key --refresh-keys

	ws "updating packages"
	pacman -Sy

	ws "Press any key to continue"
	read
}

function config_language(){
	ws "input your language:"
	ws "ex: pt_BR"
	read LANGUAGE

	ws "input your keymap:"
	ws "ex: br-abnt2"
	read KEYMAP

	ws "setting language and keymap"
	echo LANG=${LANGUAGE}.UTF-8 > /etc/locale.conf
	export LANG=${LANGUAGE}.UTF-8
	echo KEYMAP=br-abnt2 > /etc/vconsole.conf

	ws "setting locales"
	sed "s/#${LANGUAGE}.UTF-8 UTF-8/${LANGUAGE}.UTF-8 UTF-8/g" /etc/locale.gen > temp
	cat temp > /etc/locale.gen
	rm temp
    locale-gen

	ws "if you do not run this script with source or . export LANG variable"
	ws "export LANG=${LANGUAGE}.UTF-8"
	ws "Press any key to continue"
	read
}

function config_clock(){
	ws "input your region:"
	ws "ex: America/Sao_Paulo"
	read REGION

	ws "setting localtime and system clock"
	ln -s /usr/share/zoneinfo/${REGION} /etc/localtime
	hwclock --systohc --utc

	ws "Press any key to continue"
	read
}

function config_network(){
	ws "input your hostname:"
	ws "ex: myComputer, housepc"
	read HOSTNAME

	ws "setting hostname"
	echo ${HOSTNAME} > /etc/hostname

	ws "installing network manager"
	pacman -S network-manager network-manager-applet
	systemctl enable NetworkManager.service
	
	ws "Press any key to continue"
	read
}

function config_user(){
	ws "input root password (echoing is disabled):"
	passwd

	ws "input a new user name:"
	read USER_NAME

	useradd -m -g users -s /bin/bash ${USER_NAME}
	ws "input ${USER_NAME} password (echoing is disabled):"
	passwd ${USER_NAME}

	ws "Press any key to continue"
	read
}

function config_grub(){
	ws "input grub install target:"
	ws "ex /dev/sda"
	read GRUB

	echo "installing and configuring grub"
	pacman -S grub

	grub-install --target=i386-pc --recheck ${GRUB}
	cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
	grub-mkconfig -o /boot/grub/grub.cfg

	ws "Press any key to continue"
	read
}

function config_graphical_env(){
	ws "installing sound packages"
	pacman -S alsa-utils pavucontrol

	ws "installing X"
	pacman -S xorg-server xorg-xinit xorg-server-utils xorg-xrandr lxrandr

	ws "installing 3D and video card support"
	pacman -S mesa xf86-video-vesa xf86-video-intel

	ws "installing and configuring user input devices"
	ws "input your keyboard key map"
	ws "ex br abnt2"
	read KEYMAP
	pacman -S xf86-input-synaptics
	localectl set-x11-keymap ${KEYMAP}

	ws "installing basic x environment and fonts"
	pacman -S xorg-twm xorg-xclock xterm ttf-dejavu

	ws "Press any key to continue"
	read
}

function config_yaourt(){

	ws "adding yaourt repo to pacman"
	cat << "EOF" >> /etc/pacman.conf

[archlinuxfr]
SigLevel = Never
Server=http://repo.archlinux.fr/$arch

EOF

	ws "installing yaourt"
	pacman -Sy yaourt

	ws "Press any key to continue"
    read
}

function install_tools(){
	pacman -S wget zip unzip git dosfstools
}

while [ "$USER_INPUT" != ":quit" ]; do

clear
printf "\n\n"
echo "***********************************************************************"
echo "********************   ARCH LINUX INSTALL SCRIPT   ********************"
echo "***********************************************************************"
printf "\n\n"
echo "    IMPORTANT!!! RUN THIS SCRIPT USING 'SOURCE', '.' OR YOU WILL NEED"
echo "TO EXPORT THE VARIABLE LANG IN STEP 2. "
printf "\n\n"
echo "choose what you want to configure"
printf "\n"
echo "0 ............... all"
echo "1 ............... pacman"
echo "2 ............... language"
echo "3 ............... clock"
echo "4 ............... network"
echo "5 ............... user account"
echo "6 ............... grub"
echo "7 ............... basic graphical environment"
echo "8 ............... yaourt"
echo "9 ............... tools"
printf "\n\n:quit - EXIT\n\n"
read USER_INPUT

case $USER_INPUT in
	0)
	    config_pacman
	    config_language
	    config_clock
	    config_network
	    config_user
	    config_grub
	    config_graphical_env
	    config_yaourt
	    install_tools
	    ;;
	1)
	    config_pacman
	    ;;
	2)
	    config_language
	    ;;
	3)
	    config_clock
	    ;;
	4)
	    config_network
	    ;;
	5)
	    config_user
	    ;;
    	6)
	    config_grub
	    ;;
	7)
	    config_graphical_env
	    ;;
	8)
	    config_yaourt
	    ;;
	9)
	    install_tools
	;;
esac

done
