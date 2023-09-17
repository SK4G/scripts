#!/bin/bash
set -e

### This script has only been tested to work on Arch Linux.
### It may be modified for other distros. 
### Debian uses resilio-sync.service insted of rslsync.service
### source: https://blog.benjie.me/installing-resilio-sync-and-running-it-as-a-regular-user/

tput setaf 6
echo "################################################################"
echo "####     			   installing resilio sync    		    ######"
echo "################################################################"
# Check if rslsync is installed using paru
if ! paru -Qs rslsync > /dev/null; then
    echo "rslsync is not installed. Installing..."
    paru -S --noconfirm rslsync
else
    echo "rslsync is already installed."
fi

mkdir -p ~/.config/rslsync/

tput setaf 7
echo "################################################################"
echo "####     	Choose to use resilio sync on LAN or WAN        ######"
echo "################################################################"
echo -e "\nChoose an option. A corresponding rslsync.conf file 
will be downloaded to ~/.config/rslsync/:
\t 1: Use resilio sync on LAN.
\t 2: Use on WAN.
Note: LAN results in faster sync transfers."

# Read user input
read -p "Enter your choice (1 or 2): " choice

# Check the user's choice and perform an action
case $choice in
    1)
        echo "You selected Option 1"
        wget -P ~/.config/rslsync/ https://raw.githubusercontent.com/SK4G/darklinux-iso/master/archiso/airootfs/etc/skel/.config/rslsync/rslsync.conf
        ;;
    2)
        echo "You selected Option 2"
        rslsync --dump-sample-config > ~/.config/rslsync/rslsync.conf
        ;;
    *)
        echo "Invalid choice. Please select 1 or 2."
        ;;
esac

tput setaf 9
echo "################################################################"
echo "####     setting resilio sync to run as user service      ######"
echo "####     this resolves resilio sync folder permissions    ######"
echo "################################################################"
user=$(id -un)
sudo sed -i "s/WantedBy=multi-user.target/WantedBy=default.target/g" /usr/lib/systemd/user/rslsync.service
sudo sed -i "s/User=rslsync/User=$user/g" /usr/lib/systemd/system/rslsync.service
sudo sed -i "s/Group=rslsync/Group=$user/g" /usr/lib/systemd/system/rslsync.service

systemctl --user enable --now rslsync.service

tput setaf 4
echo "################################################################"
echo "####           finished setting up resilio sync           ######"
echo "####           access at http://localhost:8888/gui/       ######"
echo "################################################################"
