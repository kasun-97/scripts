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

# Configure Session and Seat management
sudo xbps-install -y dbus
sudo ln -s /etc/sv/dbus/ /var/service/dbus
sudo xbps-install -y elogind

# Enable SSH service
sudo ln -s /etc/sv/sshd /var/service/

# Install graphics drivers - AMD
sudo xbps-install -y mesa-dri vulkan-loader mesa-vulkan-radeon xf86-video-amdgpu mesa-vaapi mesa-vdpau

# Install bspwm with sxhkd
sudo xbps-install -y xorg-minimal xinit
sudo xbps-install -y bspwm sxhkd
install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Start bspwm with dbus-run-session
echo "dbus-run-session bspwm" > ~/.xinitrc
