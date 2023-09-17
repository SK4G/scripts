#!/bin/bash

# guest# mount -t virtiofs mount_tag /mnt/mount/path
# mount tag must be host full path

sudo mkdir /mnt/vm-share
sudo mount -t virtiofs /mnt/vm-share /mnt/vm-share

echo '
/mnt/vm-share /mnt/vm-share virtiofs rw,noatime,_netdev 0 0' | sudo tee --append /etc/fstab
