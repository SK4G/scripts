#!/bin/bash
set -e

tput setaf 3
echo "################################################################"
echo "####     downloading vs code	    					    ######"
echo "################################################################"
tput setaf 7

wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O VSCode-linux-x64.tar.gz
tar -xzvf VSCode-linux-x64.tar.gz

tput setaf 3
echo "################################################################"
echo "####     Do you wish to migrate your    					######"
echo "####     current vs code settings (y/n):	    			######"
echo "################################################################"
read migrate
tput setaf 7

mkdir -p VSCode-linux-x64/data/user-data/

if [[ $migrate =~ ^[Yy] ]]; then
    if [ -d "$HOME/.config/Code/" ]; then
        cp -rv "$HOME/.config/Code/"* "VSCode-linux-x64/data/user-data"
        echo "VS Code settings copied to VSCode-linux-x64/data/user-data"
    else
        echo "The $HOME/.config/Code/ folder does not exist."
    fi
else
    echo "No settings were copied."
fi

tput setaf 3
echo "################################################################"
echo "####          Do you want to create an archive of the  	######"
echo "####          VSCode-linux-x64 folder? (y/n):          	######"
echo "################################################################"
read answer
tput setaf 7

# Check the user's response
if [[ $answer =~ ^[Yy] ]]; then
    # If the user enters 'Y' or 'y', create the archive
    rm VSCode-linux-x64.tar.gz
    tar -czvf VSCode-linux-x64.tar.gz VSCode-linux-x64
    echo "Archive created: VSCode-linux-x64.tar.gz"
else
    # If the user enters anything else, display a message
    echo "No archive was created."
fi

tput setaf 3
echo "################################################################"
echo "####          finished creating portable vs code          ######"
echo "################################################################"
tput setaf 7
