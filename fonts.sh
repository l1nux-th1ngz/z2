#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get update

# =========================
# Fonts
# =========================
sudo apt-get -y install fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-recommended
sudo apt-get -y install fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-font-awesome
sudo apt-get -y install fonts-opensymbol ttf-bitstream-vera ttf-mscorefonts-installer fonts-terminus

# =========================
# Update
# =========================
sudo apt-get update

echo "Done"
