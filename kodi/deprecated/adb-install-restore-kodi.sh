#!/bin/bash

####This script copies a kodi configuration to and android device

kodi=/mnt/TEAM-1TB/Android/kodi-pc-backup-w-addons/.kodi
# remote=192.168.1.88:/sdcard/Android/data/org.xbmc.kodi/files
remote=192.168.1.29:/storage/emulated/0/Android/data

#install kodi on remote device
#adb install name.apk
adb shell 
am start -a android.intent.action.VIEW -d market://details?id=org.xbmc.kodi
sleep 10
#am start -n org.xbmc.kodi/org.xbmc.kodi.ActivityName
sleep 30
pm grant org.xbmc.kodi android.permission.WRITE_EXTERNAL_STORAGE
monkey -p org.xbmc.kodi -c android.intent.category.LAUNCHER 1
exitr xc xz 

mkdir -p $remote/addons/skin.eminence.2/
adb push $kodi $remote

cp -rf $HOME/.kodi-backup/* $HOME/.kodi
