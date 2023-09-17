#!/bin/bash

####This script copies a kodi configuration to and android device

backup=/mnt/TEAM-1TB/Android/kodi-full-ezra
# remote=192.168.1.88:/sdcard/Android/data/org.xbmc.kodi/files
#Fire TV 2 storage location
#remote=/storage/emulated/0/Android/data/org.xbmc.kodi

adb pull /storage/emulated/0/Android/data/org.xbmc.kodi /mnt/TEAM-1TB/Android/kodi-full-ezra
