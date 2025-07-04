#!/bin/bash

# =========================
# Update
# =========================
sudo apt-get -y update

sudo apt-get -y install gnupg


# =========================
# Brave Browser
# =========================
BRAVE_KEY_URL="https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"
BRAVE_KEYRING_PATH="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
BRAVE_REPO_DEFINITION="deb [arch=amd64 signed-by=${BRAVE_KEYRING_PATH}] https://brave-browser-apt-release.s3.brave.com/ stable main"
BRAVE_REPO_FILE="/etc/apt/sources.list.d/brave-browser-release.list"

if [ ! -f "$BRAVE_KEYRING_PATH" ]; then
  sudo curl -fsSL "$BRAVE_KEY_URL" -o "$BRAVE_KEYRING_PATH"
fi

if [ ! -f "$BRAVE_REPO_FILE" ] || ! grep -q "$BRAVE_REPO_DEFINITION" "$BRAVE_REPO_FILE"; then
  echo "$BRAVE_REPO_DEFINITION" | sudo tee "$BRAVE_REPO_FILE" > /dev/null
fi

sudo apt-get update
sudo apt-get -y install brave-browser




# =========================
# Firefox 
# =========================


# Variables
KEYRING_DIR="/etc/apt/keyrings"
KEY_FILE="$KEYRING_DIR/packages.mozilla.org.asc"
REPO_LIST="/etc/apt/sources.list.d/mozilla.list"
EXPECTED_FP="35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3"

# Create keyring directory if it doesn't exist
echo "📁 Creating keyring directory..."
sudo install -d -m 0755 "$KEYRING_DIR"

# Download and store Mozilla GPG key
echo "🔑 Downloading Mozilla's GPG key..."
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee "$KEY_FILE" > /dev/null

# Verify the key fingerprint
echo "🧪 Verifying GPG fingerprint..."
ACTUAL_FP=$(gpg -n --quiet --import --import-options import-show "$KEY_FILE" | awk '/^fpr:/ { print $10 }')

if [[ "$ACTUAL_FP" == "$EXPECTED_FP" ]]; then
  echo "✔️ Fingerprint match: $ACTUAL_FP"
else
  echo "❌ Fingerprint mismatch!"
  echo "   Expected: $EXPECTED_FP"
  echo "   Actual:   $ACTUAL_FP"
  exit 1
fi

# Add Mozilla APT repository
echo "📦 Adding Mozilla repository to APT sources..."
echo "deb [signed-by=$KEY_FILE] https://packages.mozilla.org/apt mozilla main" | sudo tee "$REPO_LIST" > /dev/null

# Set APT priority for Mozilla packages
echo "📌 Configuring APT pinning..."
sudo tee /etc/apt/preferences.d/mozilla > /dev/null <<EOF
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
EOF

# Update APT and install Firefox
echo "🔄 Updating package list..."
sudo apt-get update

echo "🦊 Installing Firefox from Mozilla APT repo..."
sudo apt-get install -y firefox

# =========================
# Update
# =========================
sudo apt-get -y update

echo "🎉 Firefox installation complete!"
