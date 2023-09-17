#!/bin/bash

####This script copies a kodi configuration to and android device

kodi=/mnt/TEAM-1TB/Android/kodi-pc-backup-w-addons/org.xbmc.kodi/
# remote=192.168.1.88:/sdcard/Android/data/org.xbmc.kodi/files
#Fire TV 2 storage location
remote=/storage/emulated/0/Android/data
#remote=/storage/emulated/0/Android/data/org.xbmc.kodi/files/.kodi
#restore
#adb pull /storage/emulated/0/Android/data/org.xbmc.kodi/ $HOME

#install kodi on remote device
adb install -r kodi-19.4-Matrix-arm64-v8a.apk
adb shell pm grant org.xbmc.kodi android.permission.WRITE_EXTERNAL_STORAGE
adb push $kodi $remote

