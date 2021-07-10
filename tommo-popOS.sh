#!/bin/sh
LIST_OF_APPS="brave-browser mpv neofetch keepassxc virtualbox flameshot gnome-tweaks youtube-dl"
LIST_OF_REMOVE="firefox gnome-sudoku aisleriot quadrapassel gimp gnome-weather gnome-todo rhythmbox pitivi brasero cheese geary gnome-calendar gnome-contacts"

echo " "
echo "Commencing OS setup..."
echo " "

apt -y install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

apt -y update && apt -y upgrade

apt remove -y $LIST_OF_REMOVE

apt install -y $LIST_OF_APPS

#mpv configuration
echo "Congfiguring mpv"
mkdir ~/.config/mpv
chmod 777 ~/.config/mpv
sudo wget https://raw.githubusercontent.com/TomDotCom4/tommo-popOS/main/mpv.conf -P ~/.config/mpv
sudo chmod 777 ~/.config/mpv/mpv.conf

echo " "
echo "This awesome script has concluded its operations!"
echo " "
