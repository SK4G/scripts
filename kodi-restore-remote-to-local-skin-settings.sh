#!/bin/bash


kodi=/mnt/TEAM-1TB/Android/kodi-pc-backup-no-addons/.kodi
remote=192.168.1.116:/storage/.kodi

mkdir -p $remote/addons/skin.eminence.2/
scp -r $kodi/addons/skin.eminence.2/* root@$remote/addons/skin.eminence.2/

mkdir -p $remote/userdata/addon_data/script.skinshortcuts/
scp -r root@$remote/userdata/addon_data/script.skinshortcuts/* $kodi/userdata/addon_data/script.skinshortcuts/

mkdir -p $remote/userdata/addon_data/plugin.video.ezra/
scp -r root@$remote/userdata/addon_data/plugin.video.ezra/* $kodi/userdata/addon_data/script.skinshortcuts/

mkdir -p $remote/userdata/addon_data/script.module.myaccounts/
scp -r root@$remote/userdata/addon_data/script.module.myaccounts/* $kodi/userdata/addon_data/script.module.myaccounts/


