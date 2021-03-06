#!/bin/bash

function get_repos(){
	sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	sudo yum install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
	sudo yum install https://rhel7.iuscommunity.org/ius-release.rpm
	
	echo "Press any key to continue..."
    read
}

function install_numix(){
	sudo curl http://download.opensuse.org/repositories/home:paolorotolo:numix/RedHat_RHEL-6/home:paolorotolo:numix.repo > /etc/yum.repos.d/numix.repo
	sudo yum install numix-gtk-theme numix-icon-theme-circle
		
	echo "Press any key to continue..."
    read
}

function install_browser(){
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repos-list/google-chrome.repo > /etc/yum.repos.d/google-chrome.repo
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repos-list/google.repo > /etc/yum.repos.d/google.repo
	sudo yum install google-chrome-stable
		
	echo "Press any key to continue..."
    read
}

function install_developer_tools(){
	sudo curl https://raw.githubusercontent.com/rafael-pinho/dot-files/master/rhel-7/repos-list/docker.repo > /etc/yum.repos.d/docker.repo 
	
	sudo yum install git docker
	systemctl enable docker.service
	curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/dc
	
	curl https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
	source ~/.bashrc
	
	echo "Press any key to continue..."
    read
}

function install_dot_net_core(){
	subscription-manager repos --enable=rhel-7-server-dotnet-rpms
	yum install scl-utils
	yum clean all
	yum upgrade -y
	yum clean all
	yum install rh-dotnetcore10
	scl enable rh-dotnetcore10 bash
	
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
echo "2 ............... numix"
echo "3 ............... google chrome"
echo "4 ............... git, docker and nvm"
echo "5 ............... dot net core"

printf "\n\n:quit - EXIT\n\n"
read USER_INPUT

case $USER_INPUT in
	0)
	    get_repos
	    install_numix
        install_browser
	    install_developer_tools
	    install_dot_net_core
	    ;;
    	1)
	    get_repos
	    ;;
	2)
	    install_numix
	    ;;
	3)
	    install_browser
	    ;;
	4)
	    install_developer_tools
	    ;;
	5)
	    install_dot_net_core
	    ;;
esac

done
