#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get -y update

echo "☕ Installing Java..."

# =========================
# Java
# =========================
sudo apt-get  -y install default-jre default-jre-headless default-jdk-headless default-jdk

wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
sudo apt-get -y install jdk-21_linux-x64_bin.deb || sudo dpkg -i jdk-21_linux-x64_bin.deb
rm jdk-21_linux-x64_bin.deb

wget https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.deb
sudo apt-get -y install jdk-24_linux-x64_bin.deb || sudo dpkg -i jdk-24_linux-x64_bin.deb
rm jdk-24_linux-x64_bin.deb


# =========================
# Perl
# =========================
echo "🧬 Installing Perl and modules..."
sudo apt-get install -y   perl-base perl perl-modules-5.36 perl-openssl-defaults perlmagick rename pkg-perl-tools 
 sudo apt-get install -y  libprogress-any-output-termprogressbarcolor-perl libcache-cache-perl 
 sudo apt-get install -y  libdebian-package-html-perl libconfig-model-dpkg-perl libnet-ldap-perl 
sudo apt-get install -y   liblocale-gettext-perl libgtk3-perl libterm-readline-gnu-perl weblint-perl
sudo apt-get -y install php-codesniffer pylint

# =========================
# Update
# =========================
sudo apt-get -y update

echo "Done"
