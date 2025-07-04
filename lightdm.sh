#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get update

# =========================
# LightDM Session
# =========================
sudo apt-get -y install lightdm lightdm-settings lightdm-gtk-greeter lightdm-gtk-greeter-settings liblightdm-gobject-1-0

sudo mkdir -p /etc/lightdm/lightdm.conf.d
sudo tee /etc/lightdm/lightdm.conf.d/99-custom.conf > /dev/null <<EOF
[Seat:*]
user-session=bspwm
greeter-hide-users=false
greeter-allow-guest=true
autologin-guest=true
allow-user-switching=true
EOF

echo "🔄 Restarting LightDM to apply changes..."
sudo systemctl enable lightdm || echo "⚠️ Failed to enable LightDM"
sudo systemctl restart lightdm || echo "⚠️ Failed to restart LightDM"
