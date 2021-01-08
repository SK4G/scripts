#!/bin/bash
#set -e

echo $'\n\n[darklinux-repo]\nSigLevel = Optional TrustedOnly\nServer  = https://sk4g.github.io/[darklinux-repo]/x86_64' >> /etc/pacman.conf

update

#sudo pacman -S darklinux-awesome-skel-git

#[darklinux-repo]
#SigLevel = Optional TrustedOnly
#Server  = https://sk4g.github.io/$repo/$arch