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

# Bluetooth audio 
sudo xbps-install -y libspa-bluetooth

# Configure bluetooth service 
sudo xbps-install -y bluez
sudo ln -s /etc/sv/bluetoothd /var/service/

# Install bspwm with sxhkd
sudo xbps-install -y xorg-minimal xinit
sudo xbps-install -y bspwm sxhkd
install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Start bspwm with dbus-run-session
echo "dbus-run-session bspwm" > ~/.xinitrc

# Install noto fonts
sudo xbps-install -y noto-fonts-ttf noto-fonts-emoji noto-fonts-cjk

# Install essential tools
sudo xbps-install -y dmenu # search tool
sudo xbps-install -y polybar # bar
sudo xbps-install -y picom # compositor
sudo xbps-install -y xrandr # need to set screen resolution
sudo xbps-install -y nitrogen # to set wallpapers easily
sudo xbps-install -y lxappearance # change appearance - gtk themes, icon themes, fonts, etc.
sudo xbps-install -y papirus-icon-theme # an icon theme
sudo xbps-install -y pcmanfm # GUI file manager

sudo xbps-install -y bash-completion git curl wget 

sudo xbps-install -y htop btop vnstat # monitoring tools
sudo ln -s /etc/sv/vnstatd /var/service/ # enable vnstat service

sudo xbps-install -y p7zip xarchiver unrar unzip # compression tools

