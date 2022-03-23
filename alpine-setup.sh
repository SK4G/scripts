#/bin/sh
#
# Setup Kiosk mode for Alpine Linux
#
#!/bin/sh

USER=alpine
KEYBOARD_LAYOUT=us
KEYBOARD_MODEL=us
WIDTH=1920
HEIGHT=1080
BROWSER=chromium
#PRIVATE=no
#TABS=yes
#URL=https://www.google.com

# Setup timezone
install -Dm 0644 /usr/share/zoneinfo/America/Chicago /etc/zoneinfo/America/Chicago
export TZ='America/Chicago' 
echo "export TZ='$TZ'" >> /etc/profile.d/timezone.sh

# Setup repos. dl-cdn.alpinelinux.org
#setup-apkrepos
#apk update
sed -i '/community/s/^#//' /etc/apk/repositories
sed -i '/edge/s/^#//' /etc/apk/repositories
apk update && apk upgrade

# Install Xorg
#
#setup-xorg-base
#apk add xrandr setxkbmap xset xsetroot
# apk add xterm xeyes xcalc

# Install Wayland
apk add wayland libinput
touch /etc/profile.d/xdg_runtime_dir.sh
echo '
if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi' | sudo tee --append /etc/profile.d/xdg_runtime_dir.sh

# install audio
apk add dbus dbus-openrc dbus-x11
rc-service dbus start
rc-update add dbus default
apk add pipewire rtkit
apk add pipewire-alsa
#dbus-launch --exit-with-session sway

# Enable Community repo


# Install Browser
#
apk add chromium

# Automatic login, no VTs, silent boot
#
cp /etc/inittab /etc/inittab.bak
cat << EOF > /etc/inittab
::sysinit:/sbin/openrc -q -C sysinit
::sysinit:/sbin/openrc -q -C boot
::wair:/sbin/openrc -q -C default
tty1::respawn:/bin/login -f $USER
tty2::respawn:/sbin/getty 38400 tty2
EOF

# Autostart Xorg
#
cat << EOF > /etc/skel/.profile
  startx 2> /dev/null
EOF

# Xorg Session

cat << EOF > /etc/skel/.xinitrc
  setxkbmap $KEYBOARD_LAYOUT $KEYBOARD_MODEL
  exec chromium-browser
EOF

# Disable Xorg VT Switch

#cat << EOF > /etc/X11/xorg.conf
#Section "ServerFlags"
#    Option "DontVTSwitch" "true"
#    Option "DontZap" "true"
#EndSection
#EOF

# Create user
apk add doas sudo
adduser $USER -D
passwd
adduser $USER wheel
echo 'permit persist :wheel' >/etc/doas.d/doas.conf
chown $USER /home/$USER && chmod 750 /home/$USER
adduser $USER audio
adduser $USER video
adduser $USER netdev
adduser $USER users
adduser $USER input

# Enable ssh
setup-sshd

# Partition disk if needed
#“Sys” represents the traditional disk installation method, and we will be using that.
#“Data” only uses the selected disk for data storage, whereas the OS is run off the RAM.
#“Lvm” will enable the Logical Volume Manager, after which you will again be asked how 
#you wish to use the disk – as sys or data.
#setup-disk


# Silent Boot

echo "" > /etc/motd
echo "" > /etc/issue

# Commit changes to disk
lbu_commit -d

