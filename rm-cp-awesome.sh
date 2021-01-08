echo
echo "################################################################## "
tput setaf 2
echo "Sync to darklinux-iso complete"
tput sgr0
echo "################################################################## "
echo
rm -f $HOME/darklinux-iso/archiso/airootfs/etc/skel/.config/awesome/rc.lua
cp -rf $HOME/.config/awesome/rc.lua $HOME/darklinux-iso/archiso/airootfs/etc/skel/.config/awesome/
cd $HOME/darklinux-iso/
sh git-v3.sh


echo
echo "################################################################## "
tput setaf 2
echo "Sync to AwesomeArch complete"
tput sgr0
echo "################################################################## "
echo
rm -f $HOME/darklinux/AwesomeArch/awesome/rc.lua
cp -rf $HOME/.config/awesome/rc.lua $HOME/darklinux/AwesomeArch/awesome/
cd $HOME/darklinux/AwesomeArch/
sh git-v3.sh


echo
echo "################################################################## "
tput setaf 2
echo "Sync to darklinux-awesome complete"
tput sgr0
echo "################################################################## "
echo
rm -f $HOME/darklinux/darklinux-awesome/awesome/rc.lua
cp -rf $HOME/.config/awesome/rc.lua $HOME/darklinux/darklinux-awesome/awesome/
cd $HOME/darklinux/darklinux-awesome/
sh git-v3.sh


echo
echo "################################################################## "
tput setaf 2
echo "Sync to darklinux-awesome-skel complete"
tput sgr0
echo "################################################################## "
echo
rm -f $HOME/darklinux/darklinux-awesome-skel/etc/skel/.config/awesome/rc.lua
cp -rf $HOME/.config/awesome/rc.lua $HOME/darklinux/darklinux-awesome-skel/etc/skel/.config/awesome/
cd $HOME/darklinux/darklinux-awesome-skel/
sh git-v3.sh


echo
echo "################################################################## "
tput setaf 2
echo "Building new darklinux-awesome-skel-git package "
tput sgr0
echo "################################################################## "
echo
cd $HOME/darklinux/darklinux-pkgbuild/darklinux-awesome-skel-git/
sh build-pkg-config.sh


#use to remove
#rm -f

#use to copy
#cp -rf

#~/.config/awesome/