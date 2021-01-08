#!/bin/bash
#set -e

tput setaf 6;echo "#######################################################################"
echo "Backing up .config/awesome and replacing with new .config/awesome files "
echo "#######################################################################"
echo;tput sgr0

cp -rf ~/.config/awesome ~/.config/awesome-backup-$(date +%Y.%m.%d-%H.%M.%S)

cp -r awesome ~/.config/awesome