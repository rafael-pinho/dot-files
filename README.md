# dot-files

Linux configuration files and scripts. 

This is not a project. This is just my linux config files and scripts. 
I put this files here because is better than backup and I can document all here. 
Well, you can use this files too. Just clone or:

```
curl file-raw-url > my-new-file.sh
chmod +x my-new-file.sh
./my-new-file.sh
```

See a list of avaliable files below.

<br>
<br>
## Arch-Linux
#### [Arch Linux installation script](/arch-linux/arch-install.sh)

Script created to help during arch linux installation. All steps is based on archlinux wiki tutorials. For more info about arch-linux install see:

- https://wiki.archlinux.org/index.php/Beginners'_guide
- https://wiki.archlinux.org/index.php/Beginners'_guide_(Português)

Get this script by the following url:
- https://raw.githubusercontent.com/rafael-pinho/dot-files/master/arch-linux/arch-install.sh
<br>
<br>

#### [Software installation](/arch-linux/software-install.sh)

Install software to common use, development and other thinks. 

- Browsers
 - Opera
 - Google Chrome
 - Firefox
- File Managers
 - Ranger
 - Nautilus
- Music Player
 - Spotify 
- Wallpaper Managers
 - Feh
 - Nitrogen
- SSH client
- NVM - Node Version Manager
- Container management
 - Docker
 - Docker-Compose
- Tools
 - wget
 - zip
 - unzip
 - git
 - dosfstools

Get this script by the following url:
 - https://raw.githubusercontent.com/rafael-pinho/dot-files/master/arch-linux/arch-software-install.sh
<br>
<br>

#### [Reset Installation](/arch-linux/arch-reset.sh)

Remove all and leave only base and base-devel. 

Get this script by the following url:
 - https://raw.githubusercontent.com/rafael-pinho/dot-files/master/arch-linux/arch-reset.sh
<br>
<br>

#### [Arch Linux i3wm installation](/arch-linux/environments/i3)

Install i3 window manager with i3status, i3lock and dmenu. Also change xinitrc to start i3 when startx is called. 

Installation script and .conf files are avaliable:
 - [install.sh](https://raw.githubusercontent.com/rafael-pinho/dot-files/master/arch-linux/environments/i3/install.sh)
 - [i3.conf](https://raw.githubusercontent.com/rafael-pinho/dot-files/master/arch-linux/environments/i3/i3.conf)
<br>
<br>

#### [My Arch Linux Packges](/arch-linux/packages)

The current instaled packages in my arch linux install (27-06-2016).
I think this is not very usefull for you...but is for me :)

 - [pacman](https://raw.githubusercontent.com/rafael-pinho/dot-files/master/arch-linux/packages/pacman.sh)
 - [yaourt](https://raw.githubusercontent.com/rafael-pinho/dot-files/master/arch-linux/packages/yaourt.sh)

<br>
<br>
## RHEL-7
#### [Software installation](/rhel-7/software-install.sh)

Install software to common use, development and other thinks to complement "server with gui" installation. 

- Repositories
 - EPEL 
- Browser
 - Google-Chrome
- Numix
 - GTK theme 
 - Numix circle icon pack
- Developer tools
 - Docker
 - Docker-Compose
 - Git
 - Nvm
- Dot Net Core
