#!/usr/bin/env bash


rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/darklinux-awesome/
rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/PKGBUILDS/darklinux-awesome-skel/etc/skel/.config/