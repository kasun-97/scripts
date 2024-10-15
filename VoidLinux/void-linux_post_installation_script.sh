#!/bin/bash

echo "Welcome to Void Linux post installation script!"

# Update the system
sudo xbps-install -Suy

# Add non free and multilib repositories
sudo xbps-install -y void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

# Install AMD graphics drivers
sudo xbps-install -y linux-firmware-amd 
sudo xbps-install -y mesa-dri 
sudo xbps-install -y vulkan-loader
sudo xbps-install -y mesa-vulkan-radeon 
sudo xbps-install -y xf86-video-amdgpu # for Xorg
sudo xbps-install -y mesa-vaapi
sudo xbps-install -y mesa-vdpau
