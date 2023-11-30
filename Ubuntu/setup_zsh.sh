#!/usr/bin/env bash

echo "Install ZSH"
sudo apt install zsh git -y

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Clone plugins"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
wget -P $HOME/.zsh/plugins https://raw.githubusercontent.com/rupa/z/master/z.sh

echo "Find 'plugins=(git)' in .zshrc and"
echo "replace it with"
echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)"

echo "To enable powerlevel10k"
echo "Set ZSH_THEME=\"powerlevel10k/powerlevel10k\" in ~/.zshrc"

echo "Get aliases dotfile"
wget -P $HOME/.oh-my-zsh https://raw.githubusercontent.com/kasun-97/dotfiles/master/.zsh/.aliases

echo "To enable aliases, add below lines in .zshrc"
echo "# Aliases"
echo "source $ZSH/.aliases"

# Swtich to zsh
chsh -s /bin/zsh

# Reference:
# https://github.com/marlonrichert/zsh-autocomplete#configuration
