# /dev/disk/by-uuid/youruuidhere /mnt/ssd xfs discard,defaults 0 0

cd /etc/
echo $'\n\n/dev/disk/by-uuid/6ec1935b-aa81-4c71-9da3-f05bce2fd46d /mnt/ssd btrfs discard,defaults 0 0' | sudo tee -a fstab
