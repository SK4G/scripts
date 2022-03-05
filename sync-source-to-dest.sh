#!/usr/bin/env bash

source="/run/media/luiz/WD-2TB/@home/luiz/"
destination="/home/luiz/"
folder=".kodi/"

# source="VirtualBox-VMs/"
# rsync -r -t -v --progress -s /run/media/luiz/WD-2TB/@home/luiz/$source /home/luiz/$source

rsync -r -t -v --progress -s $source$folder $destination$folder