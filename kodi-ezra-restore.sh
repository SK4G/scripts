#!/bin/bash

#scp -rv * root@192.168.1.116:/storage/.kodi/addons/skin.eminence.2
kodi=/mnt/TEAM-1TB/Android/rsync/minimal-ezra/org.xbmc.kodi/files/.kodi/
remote=192.168.1.116

scp -rv $kodi/addons/skin.eminence.2/* root@$remote:/storage/.kodi/addons/skin.eminence.2/

scp -rv $kodi/userdata/addon_data/script.skinshortcuts/* root@$remote:/storage/.kodi/userdata/addon_data/script.skinshortcuts/

#scp -rv $kodi/userdata/addon_data/skin.eminence.2/* root@$remote:/storage/.kodi/userdata/addon_data/skin.eminence.2/


