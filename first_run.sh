#!/bin/bash

add-apt-repository -y ppa:numix/ppa
add-apt-repository -y ppa:neovim-ppa/stable

apt-key adv --keyserver "hkp://keyserver.ubuntu.com:80" --recv-keys "BBEBDCB318AD50EC6865090613B00F1FD2C19886"
echo deb "http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list

apt update
apt install -y numix-icon-theme-circle
apt install -y spotify-client
apt install -y python-dev python-pip python3-dev python3-pip
apt install -y neovim
pip3 install neovim -U

xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Numix-Circle"
#xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --set /usr/share/backgrounds/xfce/xfce-blue.jpg
