#!/bin/sh
LIST_OF_APPS="brave-browser vlc neofetch keepassxc virtualbox flameshot obs-studio gnome-tweaks"
LIST_OF_REMOVE="firefox gnome-sudoku aisleriot quadrapassel gimp gnome-weather gnome-todo rhythmbox pitivi brasero cheese geary gnome-calendar gnome-contacts"

echo " "
echo "Commencing OS setup..."
echo " "

apt install apt-transport-https curl

curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|tee /etc/apt/sources.list.d/brave-browser-release.list

apt update

apt upgrade

apt remove -y $LIST_OF_REMOVE

apt install -y $LIST_OF_APPS

echo " "
echo "This awesome script has concluded its operations!"
echo " "
