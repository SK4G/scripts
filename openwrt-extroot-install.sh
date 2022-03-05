#!/usr/bin/env bash

#this script mounts an openwrt system to exroot external storage

opkg update
opkg install block-mount kmod-fs-ext4 kmod-usb-storage kmod-usb-ohci kmod-usb-uhci e2fsprogs fdisk

#Configure /etc/config/fstab to mount the rootfs_data in another directory in case you need to access the original root overlay to change your extroot settings
DEVICE="$(sed -n -e "/\s\/overlay\s.*$/s///p" /etc/mtab)"
uci -q delete fstab.rwm
uci set fstab.rwm="mount"
uci set fstab.rwm.device="${DEVICE}"
uci set fstab.rwm.target="/rwm"
uci commit fstab

#Here mtdblock are the devices in internal flash memory, and /dev/sda1 is the partition on a USB flash drive that we format to ext4
DEVICE="/dev/sda1"
mkfs.ext4 ${DEVICE}

#Now we configure the selected partition as new overlay via fstab UCI subsystem
eval $(block info ${DEVICE} | grep -o -e "UUID=\S*")
uci -q delete fstab.overlay
uci set fstab.overlay="mount"
uci set fstab.overlay.uuid="${UUID}"
uci set fstab.overlay.target="/overlay"
uci commit fstab

#We now transfer the content of the current overlay inside the external drive and reboot the device to apply changes
mkdir -p /tmp/cproot
mount --bind /overlay /tmp/cproot
mount ${DEVICE} /mnt
tar -C /tmp/cproot -cvf - . | tar -C /mnt -xf -	
umount /tmp/cproot
umount /mnt
reboot


#Save opkg lists to /usr/lib/opkg/lists stored on the extroot, instead of in RAM. This makes package lists survive reboot and saves some RAM
sed -i -e "/^lists_dir\s/s:/var/opkg-lists$:/usr/lib/opkg/lists:" /etc/opkg.conf
opkg update

# LuCI → System → Mount Points should show USB partition mounted as overlay.
# LuCI → System → Software should show free space of overlay partition.

# The USB partition should be mounted to /overlay. Free space for / should be the same as /overlay.

# grep -e /overlay /etc/mtab
# /dev/sda1 /overlay ext4 rw,relatime,data=ordered
# overlayfs:/overlay / overlay rw,noatime,lowerdir=/,upperdir=/overlay/upper,workdir=/overlay/work
 
# df /overlay /
# Filesystem           1K-blocks      Used Available Use% Mounted on
# /dev/sda1              7759872    477328   7221104   6% /overlay
# overlayfs:/overlay     7759872    477328   7221104   6% /

# Troubleshooting
# Analyze the preinit stage of the boot log:
# block info; uci show fstab; logread | sed -n -e "/- preinit -/,/- init -/p"
# If you receive a “block: extroot: UUID mismatch” error in your logs after upgrading, remove .extroot-uuid from the volume:
# mount /dev/sda1 /mnt
# rm -f /mnt/.extroot-uuid /mnt/etc/.extroot-uuid
# umount /mnt