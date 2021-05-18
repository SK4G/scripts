#!/bin/bash
#set -e


#copy icons
#cp -rf elementum-icons $HOME/.kodi/addons/skin.eminence.2/extras/icons/

#copy skin backup
#cp -rf Eminence.2-Skinbackup.zip $HOME/.kodi/userdata/addon_data/script.skin.helper.skinbackup/

#copy skin backup and xml
cp -rf addon_data $HOME/.kodi/userdata/

#copy eminence skin
cp -rf skin.eminence.2 $HOME/.kodi/addons/


#sudo rm -rf $HOME/
#cp -rf $HOME/ 