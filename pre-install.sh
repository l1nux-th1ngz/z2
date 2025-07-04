#!/bin/bash

# Test internet connection
ping -c 1 8.8.8.8 >/dev/null 2>&1 || {
  echo "⚠️ No network connection. Aborting."
  exit 1
}

# =========================
# Update
# =========================
sudo apt-get update

# =========================
# First Steps
# =========================

# Packages
sudo apt-get -y install apt-rdepends git curl wget dialog whiptail dbus dbus-user-session passwd sensible-utils
sudo apt-get -y install systemd-sysv libnss-systemd libpam-systemd usrmerge init-system-helpers usr-is-merged
sudo apt-get -y install gsettings-desktop-schemas gsettings-desktop-schemas-dev gir1.2-gdesktopenums-3.0 glib-compile-schemas
sudo apt-get -y install iw debsecan pexec parallel bash-completion libselinux1 gvfs gvfs-backends gvfs-daemons gvfs-fuse gvfs-libs
sudo apt-get -y install base-files base-passwd accountsservice adduser coreutils dash debianutils sysvinit-utils tar util-linux
sudo apt-get -y install diffutils findutils grep gzip hostname init-system-helpers libc-bin login ncurses-base ncurses-bin perl-base sed
sudo apt-get -y install exif git-lfs git-all

# Enable bash completion if not already set
BASHRC="$HOME/.bashrc"
if [ -f "$BASHRC" ] && ! grep -q "bash_completion" "$BASHRC"; then
  cat << 'EOF' >> "$BASHRC"

# Enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
EOF
  source "$BASHRC"
fi

# =========================
# Update
# =========================
sudo apt-get update

echo "Done"
