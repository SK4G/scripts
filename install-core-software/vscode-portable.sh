#!/bin/bash
set -e

tput setaf 3
echo "################################################################"
echo "####     downloading vs code	    					    ######"
echo "################################################################"
tput setaf 7

wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O vscode-linux-x64.tar.gz
tar -xzvf vscode-linux-x64.tar.gz

tput setaf 3
echo "################################################################"
echo "####     if $HOME/.config/Code/ exists copying vs code    ######"
echo "####     settings to portable vs code					    ######"
echo "################################################################"
tput setaf 7

mkdir -p VSCode-linux-x64/data/user-data/

if [ -d "$HOME/.config/Code/" ]; then
    cp -r "$HOME/.config/Code/"* "VSCode-linux-x64/data/user-data"
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
