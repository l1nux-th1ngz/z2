#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get update

# =========================
# Display
# =========================
sudo apt-get -y install xorg xorg-dev xserver-xorg xserver-common xserver-xorg-core gdebi
sudo apt-get -y install xserver-xorg-input-all xserver-xorg-input-libinput xserver-xorg-legacy
sudo apt-get -y install xserver-xorg-video-all xserver-xorg-video-fbdev xserver-xorg-video-intel
sudo apt-get -y install xserver-xorg-video-nouveau xserver-xorg-video-qxl xserver-xorg-video-vesa
sudo apt-get -y install xserver-xorg-video-vmware xtrans-dev xserver-xephyr xauth x11proto-core-dev
sudo apt-get -y install xserver-xorg-video-siliconmotion xrdp x11-xserver-utils dbus-x11
sudo apt-get -y install x11proto-dev x11-apps x11-common x11-session-utils x11-utils x11-xkb-utils xinit

# =========================
# Update
# =========================
sudo apt-get update

echo "Done"
