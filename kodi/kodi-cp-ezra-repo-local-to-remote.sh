#!/bin/bash

kodi=/mnt/TEAM-1TB/Android/repository.ezra-0.0.1.zip
remote=192.168.1.88:/storage/downloads/

#mkdir -p $kodi/addons/skin.eminence.2/
scp -r $kodi root@$remote

#mkdir -p $kodi/userdata/addon_data/script.skinshortcuts/
#scp -r root@$remote:/storage/.kodi/userdata/addon_data/script.skinshortcuts/* $kodi/userdata/addon_data/script.skinshortcuts/

#scp -r root@$remote:/storage/.kodi/userdata/addon_data/skin.eminence.2/* $kodi/userdata/addon_data/skin.eminence.2/*

