#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get -y update

# =========================
# Build Tools and Libraries
# =========================
sudo apt-get -y install make cmake ninja-build arandr autorandr autotools-dev meson automake libavahi-core7
sudo apt-get -y install libxrandr-dev libxinerama-dev mesa-common-dev libgl1-mesa-dev libxcb-randr0 libavahi-glib1
sudo apt-get -y install libglu1-mesa-dev libxcb-util0-dev libxcb-ewmh-dev flex dh-autoreconf
sudo apt-get -y install libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev texi2html
sudo apt-get -y install libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev build-essential
sudo apt-get -y install avahi-daemon acpi acpid acpica-tools avahi-autoipd avahi-utils
sudo apt-get -y install libavahi-client-dev libavahi-client3 libavahi-common-data libavahi-common3
sudo apt-get -y install util-linux pciutils lm-sensors lsb-release uptimed coreutils gawk mawk blueman
sudo apt-get -y install bluetooth bluez bluez-firmware avahi-discover avahi-ui-utils libnss-mdns
sudo apt-get -y install gcc exif gvfs-fuse libxcb-ewmh2 libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-keysyms1-dev

# =========================
# Enable and Start Services
# =========================
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo systemctl enable acpid
sudo systemctl start acpid
sudo systemctl enable avahi-daemon.service avahi-daemon.socket
sudo systemctl start avahi-daemon.service avahi-daemon.socket

# =========================
# Update
# =========================
sudo apt-get update

echo "Done"
