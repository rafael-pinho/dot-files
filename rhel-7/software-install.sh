#!/bin/bash

function get_repos(){
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/docker.repo > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/google-chrome.repo > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/google.repo > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/opera.repo > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/epel.repo > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/epel-testing.repo > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/mirrors-rpmforge > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/mirrors-rpmforge-extras > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/mirrors-rpmforge-testing > /etc/yum.repo.d/
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repo-list/rpmforge.repo > /etc/yum.repo.d/
	
	echo "Press any key to continue..."
        read
}

function install_browser(){
	sudo yum install google-chrome-stable
}

function install_developer_tools(){
	sudo yum install git docker

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

