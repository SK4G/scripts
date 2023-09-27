#!/usr/bin/env bash
builddir=/mnt/SeagateNFS/darklinux/darklinux-pkgbuild
pkgpath=/mnt/SeagateNFS/darklinux
basedir=/mnt/SeagateNFS

rsync -r -t -v --progress -s $HOME/.config/awesome $HOME/darklinux-awesome/
rsync -r -t -v --progress -s $HOME/.config/awesome $pkgpath/darklinux-awesome/
cd $pkgpath/darklinux-awesome/
sh git-v3.sh

rsync -r -t -v --progress -s $HOME/.config/awesome $pkgpath/darklinux-awesome-skel/etc/skel/.config/
cd $pkgpath/darklinux-awesome-skel/
sh git-and-build.sh
#sh git-v3.sh

#cd $builddir/darklinux-awesome-skel-git/
#sh build-pkg-config.sh
#cd $pkgpath
#sh git-v3.sh

cd $basedir/darklinux/darklinux-repo/
sh repo-scan-git-v3.sh

#rsync -r -t -v --progress -s /home/luiz/darklinux/ $basedir/darklinux/
