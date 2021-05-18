#!/usr/bin/env bash


#rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/darklinux-awesome/
rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/darklinux/darklinux-awesome/
cd $HOME/darklinux/darklinux-awesome/
sh git-v3.sh

rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/darklinux/darklinux-awesome-skel/etc/skel/.config/
$HOME/darklinux/darklinux-awesome-skel/
sh git-v3.sh

cd $HOME/darklinux/darklinux-pkgbuild/darklinux-awesome-skel-git/
sh build-pkg-config.sh
cd $HOME/darklinux/darklinux-pkgbuild/
sh git-v3.sh

cd $HOME/darklinux/darklinux-repo/
sh repo-scan-git-v3.sh