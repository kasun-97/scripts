#!/usr/bin/env bash
sudo apt update

echo -e "Installing some extras"
sudo apt install -y neofetch tmate ranger bash-completion neovim

echo -e "Installing build essentials"
sudo apt install -y \
    bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick \
    lib32ncurses5-dev lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev \
    libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync \
    schedtool squashfs-tools xsltproc \
    zip zlib1g-dev

echo "Installing the repo command"
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo

echo "symlink 'python' to 'python3'" 
sudo ln -s /usr/bin/python3 /usr/bin/python
