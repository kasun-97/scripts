#!/bin/bash

echo "Welcome to Void Linux post installation script!"

# Update the system
sudo xbps-install -Suy

# Add non-free and multilib repositories
sudo xbps-install -y void-repo-nonfree void-repo-multilib void-repo-multilib-nonfreeo

# Update the system again
sudo xbps-install -Suy

# Install firmware - AMD
sudo xbps-install -y linux-firmware-amd

# Install essentials needed
sudo xbps-install -y bash-completion git curl wget unzip