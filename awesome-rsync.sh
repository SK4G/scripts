#!/bin/bash

rsync -r -t -v --progress -s $HOME/.config/awesome/rc/lua $HOME/darklinux/darklinux/darklinux-awesome/awesome/rc.lua
rsync -r -t -v --progress -s $HOME/.config/awesome/rc/lua $HOME/darklinux/darklinux-awesome-skel/etc/skel/.config/awesome/rc.lua
