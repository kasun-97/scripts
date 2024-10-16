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

# Install noto fonts
sudo xbps-install -y noto-fonts-ttf noto-fonts-emoji noto-fonts-cjk

# Install JetBrainsMono Nerd Font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

# Configuring audio with PipeWire
sudo xbps-install -y pipewire
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

# ASLA integration
# sudo mkdir -p /etc/alsa/conf.d
# sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
# sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d

# Configure bluetooth service 
sudo xbps-install -y bluez
sudo ln -s /etc/sv/bluetoothd /var/service/

# Bluetooth audio 
sudo xbps-install -y libspa-bluetooth

# Install essential tools
sudo xbps-install -y dmenu polybar picom xrandr nitrogen lxappearance papirus-icon-theme pcmanfm htop btop vnstat p7zip xarchiver unrar
	# dmenu           # search tool
	# polybar         # bar
	# picom           # compositor
	# xrandr          # needed to set screen resolution
	# nitrogen        # to set wallpapers easily
	# lxappearance    # change appearance - gtk themes, icon themes, fonts, etc.
	# papirus-icon-theme   # an icon theme
	# pcmanfm          # GUI file manager
	# htop btop vnstat   # monitoring tools
	# p7zip xarchiver unrar # compression tools

sudo ln -s /etc/sv/vnstatd /var/service/ # enable vnstat service

# Install ZSH and Oh My ZSH
sudo xbps-install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install ZSH plugins needed
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Use my zshrc configuration
mv ~/.zshrc ~/.zshrc_ # backup current config file
wget -P $HOME https://raw.githubusercontent.com/kasun-97/dotfiles/master/.zsh/.zshrc

# Get aliases dotfile
wget -P $HOME/.oh-my-zsh https://raw.githubusercontent.com/kasun-97/dotfiles/master/.zsh/.aliases