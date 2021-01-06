#!/usr/bin/env bash


rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/darklinux-config-awesome/awesome
rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/darklinux-skel-config-awesome/etc/skel/.config/awesome