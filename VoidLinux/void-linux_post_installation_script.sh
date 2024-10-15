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

# Configure Session and Seat management
sudo xbps-install -y dbus
sudo ln -s /etc/sv/dbus/ /var/service/dbus
sudo xbps-install -y elogind

# Configuring audio with PipeWire
sudo xbps-install -y pipewire
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

# ASLA integration
# sudo mkdir -p /etc/alsa/conf.d
# sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
# sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
