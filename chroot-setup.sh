#!/bin/bash
#set -e
#verify package folder has same name as package being built

sudo pacman -S devtools arch-install-scripts

mkdir ~/Documents/chroot
CHROOT=$HOME/Documents/chroot
mkarchroot $CHROOT/root base-devel