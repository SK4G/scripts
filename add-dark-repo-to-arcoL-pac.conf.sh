#!/bin/bash
#set -e

cd $HOME/arcolinuxl-iso/archiso/airootfs/etc/
echo $'\n\n[darklinux-repo]\nSigLevel = Optional TrustedOnly\nServer  = https://sk4g.github.io/[darklinux-repo]/x86_64' | sudo tee -a pacman.conf

#[darklinux-repo]
#SigLevel = Optional TrustedOnly
#Server  = https://sk4g.github.io/$repo/$arch