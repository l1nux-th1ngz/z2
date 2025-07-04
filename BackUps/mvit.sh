#!/usr/bin/env bash

# Enable strict error handling
set -euo pipefail

# Colors
info() { echo -e "\e[32m[INFO]\e[0m $1"; }
warn() { echo -e "\e[33m[WARN]\e[0m $1"; }
err()  { echo -e "\e[31m[ERR]\e[0m $1"; }

# Target dirs
HOME_DIR="$HOME"
LOCAL_DIR="$HOME/.local"
CONFIG_DIR="$HOME/.config"

# Ensure base dirs exist
mkdir -p "$LOCAL_DIR/bin" "$LOCAL_DIR/share" "$CONFIG_DIR"

info "Copying dotfiles to \$HOME"
cp -fv .Xauthority .bash_logout .bashr .gtkrc-2.0 .profile "$HOME_DIR" || warn "Some dotfiles were missing"

info "Copying bin and share to ~/.local"
cp -rT bin "$LOCAL_DIR/bin"
cp -rT share "$LOCAL_DIR/share"

info "Making everything in ~/.local/bin executable"
find "$LOCAL_DIR/bin" -type f -exec chmod +x {} +

info "Copying config directory to ~/.config"
cp -rT config "$CONFIG_DIR"

# Directories to chmod under .config
config_exec_dirs=(
  bspwm
  shxkd
  scripts
  hypr
  rofi
  dmenu
)

for dir in "${config_exec_dirs[@]}"; do
  full_path="$CONFIG_DIR/$dir"
  if [[ -d "$full_path" ]]; then
    info "Making files and subdirectories in $full_path executable"
    find "$full_path" -type f -exec chmod +x {} +
    find "$full_path" -type d -exec chmod +x {} +
  else
    warn "$dir not found under ~/.config"
  fi
done

info "✅ All operations complete."
