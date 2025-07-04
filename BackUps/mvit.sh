#!/usr/bin/env bash
set -euo pipefail

# 📢 Simple message output
info() {
  echo -e "\e[32m[INFO]\e[0m $1"
}

# 📁 Copy configs to ~/.config
if [[ -d config ]]; then
  cp -r config/* "$HOME/.config/"
  chmod +x "$HOME/.config/"*.sh 2>/dev/null || true
  info "Copied config files and set permissions on .sh scripts."
else
  echo "No 'config' directory found."
fi

# 📁 Copy local files to ~/.local
if [[ -d local ]]; then
  cp -r local/* "$HOME/.local/"
  chmod +x "$HOME/.local/"*.sh 2>/dev/null || true
  info "Copied local files and set permissions on .sh scripts."
else
  echo "No 'local' directory found."
fi

# 📄 Copy individual dotfiles
for file in .profile .bashrc .Xauthority .bash_logout .gtkrc-2.0; do
  if [[ -f $file ]]; then
    cp -v "$file" "$HOME"
  else
    echo "Skipping $file (not found)"
  fi
done

info "✅ All operations complete."
