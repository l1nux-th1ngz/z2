#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get update

# =========================
# Polkits
# =========================
sudo apt-get -y install policykit-1 polkitd pkexec policykit-1-gnome
sudo apt-get -y install libpolkit-gobject-1-dev libpolkit-gobject-1-0
sudo apt-get -y install libpolkit-agent-1-0 libpolkit-agent-1-dev gir1.2-polkit-1.0

# =========================
# Update
# =========================
sudo apt-get update

echo "Done."
