#!/bin/bash


kodi=/mnt/TEAM-1TB/Android/kodi-pc-backup-w-addons
remote=192.168.1.116

#mkdir -p $kodi/addons/skin.eminence.2/
scp -r root@$remote:/storage/.kodi/* $kodi/.kodi

#mkdir -p $kodi/userdata/addon_data/script.skinshortcuts/
#scp -r root@$remote:/storage/.kodi/userdata/addon_data/script.skinshortcuts/* $kodi/userdata/addon_data/script.skinshortcuts/

#scp -r root@$remote:/storage/.kodi/userdata/addon_data/skin.eminence.2/* $kodi/userdata/addon_data/skin.eminence.2/*


