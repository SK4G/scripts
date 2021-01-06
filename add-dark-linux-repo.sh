#!/bin/bash
#set -e

echo $'\n\n[dark-linux-repo]\nSigLevel = Optional TrustedOnly\nServer  = https://sk4g.github.io/[dark-linux-repo]/x86_64' >> /etc/pacman.conf

update

sudo pacman -S darklinux-config-awesome-git

#[dark-linux-repo]
#SigLevel = Optional TrustedOnly
#Server  = https://sk4g.github.io/$repo/$arch