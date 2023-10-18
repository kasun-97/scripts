#!/usr/bin/env bash

echo "Install ZSH"
sudo apt install zsh git -y

echo "Clone plugins"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/plugins/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/plugins/zsh-syntax-highlighting
wget -P $HOME/.zsh/plugins https://raw.githubusercontent.com/rupa/z/master/z.sh

echo "Get the dotfiles"
wget -P $HOME/.zsh https://raw.githubusercontent.com/kasun-97/dotfiles/master/.zsh/.zshrc 
wget -P $HOME/.zsh https://raw.githubusercontent.com/kasun-97/dotfiles/master/.zsh/.aliases

echo "Create a symbolic for our custom .zshrc location"
rm ~/.zshrc #remove the current config file if it excist.
ln -s -T ~/.zsh/.zshrc ~/.zshrc

echo "Swtich to ZSH"
chsh -s /bin/zsh

# Reference:
# https://github.com/marlonrichert/zsh-autocomplete#configuration
