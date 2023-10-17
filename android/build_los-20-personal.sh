#!/usr/bin/env bash

echo "setup the build environment"
wget https://raw.githubusercontent.com/kasun-97/scripts/master/android/setup_build_envirionment-ubuntu.sh
chmod +x setup_build_envirionment-ubuntu.sh
./setup_build_envirionment-ubuntu.sh
rm setup_build_envirionment-ubuntu.sh

echo "configure git" # - replace user name and email with your own ones
git config --global user.name "Your Name"
git config --global user.email "yourmail@email.com"
git config --global color.ui true #this stops the repo init colorization prompt

echo "create directories"
mkdir -p ~/android/lineage 
mkdir -p ~/android/ccache/lineage

echo "initiate the LineageOS repo"
cd ~/android/lineage
repo init -u https://github.com/kasun-97/LineageOS-20.0.git -b los-20 --git-lfs

echo "clone local manifest"
wget https://raw.githubusercontent.com/kasun-97/local_manifests/master/sweet/sweet_los-20_roomservice.xml -P ~/android/lineage/.repo/local_manifests/

echo "sync the source"
repo sync -j$(nproc --all)

echo "enable ccache"
export USE_CCACHE=1 && export CCACHE_DIR=~/android/ccache/lineage && export CCACHE_EXEC=/usr/bin/ccache && ccache -M 100G

echo "setup build environment"
source build/envsetup.sh
croot

echo "prepare sweet for building"
lunch lineage_sweet-userdebug

echo "start building"
mka bacon -j$(nproc --all)
