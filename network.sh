#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get update

# =========================
# Network, and Utilities
# =========================
sudo apt-get -y install mtools smbclient cifs-utils ripgrep fd-find autoconf xbacklight
sudo apt-get -y install maim scrot slop terminator autoconf-archive shared-mime-info light
sudo apt-get -y install bluefish bluefish-data bluefish-plugins dhmake suckless-tools libtext-template-perl
sudo apt-get -y install geany geany-plugins rxvt-unicode cdbs debhelper gettext libgtk-3-dev network-manager-gnome
sudo apt-get -y install network-manager gnome-power-manager ghostscript ghostscript-x lintian binutils-multiarch
sudo apt-get -y install glib2.0 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libglib2.0-tests whiptail
sudo apt-get -y install libghc-gio-dev libgio-2.0-dev libgdk-pixbuf2.0-bin gdk-pixbuf ruby-gdk-pixbuf2
sudo apt-get -y install unzip zip xvkbd xinput lxappearance lxappearance-obconf dialog dosfstools xdotool playerctl brightnessctl
sudo apt-get -y install wmctrl xbindkeys libnotify-bin rofi polybar kitty alacritty xautomation xsettingsd

# =========================
# Update
# =========================
sudo apt-get update

echo "Done"
