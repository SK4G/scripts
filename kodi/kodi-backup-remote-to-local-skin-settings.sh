#!/bin/bash


kodi=/mnt/TEAM-1TB/Android/kodi-pc-backup-no-addons
remote=192.168.1.116

mkdir -p $kodi/.kodi/addons/skin.eminence.2/
scp -r root@$remote:/storage/.kodi/addons/skin.eminence.2/* $kodi/.kodi/addons/skin.eminence.2/

mkdir -p $kodi/.kodi/userdata/addon_data/script.skinshortcuts/
scp -r root@$remote:/storage/.kodi/userdata/addon_data/script.skinshortcuts/* $kodi/.kodi/userdata/addon_data/script.skinshortcuts/

mkdir -p $kodi/.kodi/userdata/addon_data/script.skinshortcuts/
scp -r root@$remote:/storage/.kodi/userdata/addon_data/plugin.video.ezra/* $kodi/.kodi/userdata/addon_data/script.skinshortcuts/
#scp -r root@$remote:/storage/.kodi/userdata/addon_data/skin.eminence.2/* $kodi/userdata/addon_data/skin.eminence.2/*


