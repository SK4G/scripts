#!/bin/bash
set -e
##################################################################################################################
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# software from AUR (Arch User Repositories)
# https://aur.archlinux.org/packages/

#giving tmp folder extra gb in order not to run out of disk space while installing software
#only if you run into issues with that
#sudo mount -o remount,size=5G,noatime /tmp

sh AUR/install-pamac-aur-v*.sh
sh AUR/install-mintstick-git-v*.sh
sh AUR/install-awesome-freedesktop-git-v*.sh
sh AUR/install-lain-git-v*.sh
sh AUR/install-chromium-vaapi-v*.sh
sh AUR/install-ttf-font-awesome-v*.sh
sh AUR/install-ttf-mac-fonts-v*.sh

echo "################################################################"
echo "####        Software from AUR Repository installed        ######"
echo "################################################################"
