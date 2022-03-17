#!/bin/bash
set -e
##################################################################################################################
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# software from AUR (Arch User Repositories)
# https://aur.archlinux.org/packages/

#giving tmp folder extra gb in order not to run out of disk space while installing software
#only if you run into issues with that
#sudo mount -o remount,size=5G,noatime /tmp

sudo pacman -S xplr --noconfirm --needed    #terminal explorer
sudo pacman -S imv --noconfirm --needed     #thumbnailer
sudo pacman -S mpv --noconfirm --needed     #used for ytfzf 
sudo pacman -S kitty --noconfirm --needed     #used for ytfzf 
#ytfzf --thumb-viewer=kitty -t

#yay -S --noconfirm --faint-git          #file exploer
#yay -S --noconfirm --needed lsparu      #pamac terminal client
yay -S --noconfirm --needed fuzzy-pkg-finder   #pamac terminal client
yay -S --noconfirm --needed fzf-open    #search and open. edit default openers $HOME/.config/fzf-open/lopen.sh
yay -S --noconfirm --needed ytfzf       #youtube fzf player


yay -S --noconfirm --needed fzf-tab-completion
echo "
source /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh
bind -x '\"\t\": fzf_bash_completion'" | sudo tee -a $HOME/.bashrc

#source /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh
#bind -x '"\t": fzf_bash_completion'

source $HOME/.bashrc

echo "################################################################"
echo "####        Software from AUR Repository installed        ######"
echo "################################################################"
