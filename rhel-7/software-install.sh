#!/bin/bash

function get_repos(){
	sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	sudo yum install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
	sudo yum install https://rhel7.iuscommunity.org/ius-release.rpm
	
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repos-list/docker.repo > /etc/yum.repo.d/docker.repo 
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repos-list/google-chrome.repo > /etc/yum.repo.d/google-chrome.repo
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repos-list/google.repo > /etc/yum.repo.d/google.repo
	
	echo "Press any key to continue..."
        read
}

function install_browser(){
	sudo yum install google-chrome-stable
}

function install_developer_tools(){
	sudo yum install git docker
	systemctl enable docker.service
	curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/dc
	
	curl https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
	source ~/.bashrc
	
	echo "Press any key to continue..."
        read
}

while [ "$USER_INPUT" != ":quit" ]; do

clear
printf "\n\n"
echo "***********************************************************************"
echo "*********************   RHEL-7 SOFTWARE SCRIPT   **********************"
echo "***********************************************************************"
printf "\n\n"
echo "    IMPORTANT!!! If you want to install nvm don't run this script as"
echo "root. "
printf "\n\n"
echo "choose what you want to do"
printf "\n"
echo "0 ............... all"
echo "1 ............... get repos"
echo "2 ............... google chrome"
echo "3 ............... git, nvm and docker"
printf "\n\n:quit - EXIT\n\n"
read USER_INPUT

case $USER_INPUT in
	0)
	    get_repos
            install_browser
	    install_developer_tools
	    ;;
	1)
	    get_repos
	    ;;
	2)
	    install_browser
	    ;;
	3)
	    install_developer_tools
	    ;;
esac

done

