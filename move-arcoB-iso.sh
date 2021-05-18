#!/bin/bash
#set -e

sudo rm -rf $HOME/Desktop/ArcoLinuxB-Out/
cp -rf $HOME/ArcoLinuxB-Out $HOME/Desktop/

#sudo rsync -r -t -p -v --progress -s $HOME/ArcoLinuxB-Out $HOME/Desktop