#!/bin/bash
#set -e

rm -rf $HOME/arcolinuxl-iso

git clone https://github.com/arcolinux/arcolinuxl-iso.git

cd $HOME/arcolinuxl-iso/archiso/
echo $'\n\n[darklinux-repo]\nSigLevel = Optional TrustedOnly\nServer  = https://sk4g.github.io/$repo/x86_64' | sudo tee -a pacman.conf

cd $HOME/arcolinuxl-iso/archiso/airootfs/etc/
echo $'\n\n[darklinux-repo]\nSigLevel = Optional TrustedOnly\nServer  = https://sk4g.github.io/$repo/x86_64' | sudo tee -a pacman.conf