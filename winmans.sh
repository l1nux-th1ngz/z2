#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get update

# =========================
# Install Nemo and User Directories
# =========================
sudo apt-get -y install nemo --no-install-recommends xdg-user-dirs xdg-user-dirs-gtk
# =========================
# Build Directories
# =========================
xdg-user-dirs-update
sleep 2
if command -v xdg-user-dirs-gtk-update &>/dev/null && [ -n "$DISPLAY" ]; then
  xdg-user-dirs-gtk-update
fi
sleep 2

# =========================
# Set locale for user directories
# =========================
echo "en_US.UTF-8" > ~/.config/user-dirs.locale

# =========================
# Window Managers
# =========================
sudo apt-get -y install bspwm sxhkd
echo "Cloning Hypr repository..."
git clone https://github.com/vaxerski/Hypr.git || { echo "Clone failed"; exit 1; }
cd Hypr || { echo "Directory not found"; exit 1; }
echo "Cleaning previous builds..."
make clear
echo "Building Hypr in release mode..."
make release || { echo "Build failed"; exit 1; }
echo "Copying Hypr executable to /usr/bin..."
sudo cp ./build/Hypr /usr/bin/
echo "Adding Hypr to display sessions..."
sudo cp ./example/hypr.desktop /usr/share/xsessions/

# =========================
# Prompt user to choose default login environment
# =========================
sudo update-alternatives --install /usr/bin/x-window-manager x-window-manager /usr/bin/bspwm 100
sudo update-alternatives --install /usr/bin/x-window-manager x-window-manager /usr/bin/Hypr 100
sudo update-alternatives --config x-window-manager
# =========================
# Final Update
# =========================
sudo apt-get update

echo "Setup complete."
