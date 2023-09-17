#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	Luiz Salazar
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo
tput setaf 1
echo "################################################################"
echo "#####             Select your system graphics               ####"
echo "################################################################"
tput sgr0
echo
echo "Select the correct desktop"
echo
echo "1.  Nvidia"
echo "2.  AMD"
echo "3.  Intel"

echo "Type the number..."

read CHOICE

case $CHOICE in

    1 )
			sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
      ;;
    2 )
			sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
      ;;
    3 )
			sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
			#steam linux dependency
			sudo pacman -S lib32-libnm
      ;;
    * )
      echo "#################################"
      echo "Choose the correct number"
      echo "#################################"
      ;;
esac





echo "Installing Steam Proton requirements"

sudo pacman -S --needed --noconfirm wine-staging winetricks
sudo pacman -S --needed --noconfirm giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox
sudo pacman -S --needed --noconfirm lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
sudo pacman -S --needed --noconfirm gamemode lib32-gamemode
cp gamemode.ini $HOME/.config/

#Nvidia
#sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

#AMD
#sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

#Intel
#sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

echo "################################################################"
echo "#########  		  Packages installed  	      ################"
echo "################################################################"
