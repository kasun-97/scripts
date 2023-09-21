#!/usr/bin/env bash

echo "Install ZSH"
sudo apt install -y zsh-autosuggestions zsh-syntax-highlighting zsh

echo "Install Oh my ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

echo "Now add plugins to ~/.zshrc line below"
echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)"
echo "reload zsh config with 'source ~/.zshrc`"
echo "You may want to switch to zsh from bash if you already have not by running 'chsh -s $(which zsh)'
