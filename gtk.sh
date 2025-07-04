#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get update


#########################################
## GTK and Glib
################################################
sudo apt-get -y install libwebkit2gtk-4.0-dev auto-tools intltoolize libgspell-1 libgtk-3-dev libglib2.0-0
sudo apt-get -y install automake build-essential intltool libglib2.0-dev libglib2.0-dev-bin gettext
sudo apt-get -y install autoconf libgtk-3 libgtksourceview-3.0-1 libwebkit2gtk-4.1-0 libgspell-1-2
sudo apt-get -y install autoconf-archive gstreamer1.0-libav gstreamer1.0-plugins-good autotools-dev gspell-1-tests libglib2.0-bin libxapp-gtk3-module
sudo apt-get -y install libwebkit2gtk-4.0 gstreamer1.0-alsa gstreamer1.0-pulseaudio libgspell-1-common libglib2.0-cil-dev
sudo apt-get -y install libgtksourceview-3.0-common libgtksourceview-3.0-dev libgl1-mesa-dri gcc libglib2.0-data gsettings-desktop-schemas-dev
sudo apt-get -y install libwebkit2gtk-4.1-dev libdbus-glib2.0-cil gir1.2-gspell-1 libglib2.0-cil inxi webkit2gtk-driver
sudo apt-get -y install xapp-sn-watcher libgspell-1-dev clang libdbus-glib2.0-cil-dev

# =========================
# Update
# =========================
sudo apt-get update

echo "Done"
