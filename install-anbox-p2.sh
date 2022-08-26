#!/bin/bash
#set -e
##################################################################################################################

##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo '
ashmem_linux
binder_linux
' | sudo tee -a /etc/modules-load.d/anbox.conf

echo '
d! /dev/binderfs 0755 root root
' | sudo tee -a /etc/tmpfiles.d/anbox.conf

mount -t binder none /dev/binderfs

echo '
none                         /dev/binderfs binder   nofail  0      0' | sudo tee -a /etc/fstab

paru -S --noconfirm --needed anbox-git

sudo systemctl enable --now anbox-container-manager.service

echo "############################################################################################################"
echo "#####################                        FIRST REBOOT                              #####################"
echo "############################################################################################################"
