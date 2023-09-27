#!/bin/bash
### https://ostechnix.com/solved-cannot-access-storage-file-permission-denied-error-in-kvm-libvirt/
### https://wiki.archlinux.org/title/Virt-manager#Non_root_KVM_without_Socket
### check if Kernel-based Virtual Machine (kvm) is supporte at below link
### https://wiki.archlinux.org/title/KVM

sudo pacman -S --needed qemu virt-manager dnsmasq iptables-nft edk2-ovmf bridge-utils vde2

#sudo pacman -S --noconfirm --needed spice-vdagent
sudo pacman -S --noconfirm --needed dmidecode

# run virt-manager as user instead of root
sudo usermod -a -G libvirt $(whoami)
sudo sed -i 's/#unix_sock_group\ =\ "libvirt"/unix_sock_group\ =\ "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms\ =\ "0770"/unix_sock_rw_perms\ =\ "0770"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/^#user = "libvirt-qemu"/user = "'"$(whoami)"'"/' /etc/libvirt/qemu.conf
sudo sed -i '/^#user = "libvirt-qemu"$/a user = "'"$(whoami)"'"' /etc/libvirt/qemu.conf

# Edit /etc/libvirt/libvirtd.conf
# Uncomment these lines
#unix_sock_group = "libvirt"
#unix_sock_rw_perms = "0770"
#sudo getent group | grep libvirtd
#echo -e "options kvm_intel nested=1" | sudo tee -a /etc/modprobe.d/kvm_intel.conf
echo -e "options kvm_amd nested=1" | sudo tee -a /etc/modprobe.d/kvm_amd.conf


sudo systemctl enable --now libvirtd
sudo systemctl enable --now virtqemud
sudo systemctl enable --now virtstoraged
sudo systemctl enable --now virtnetworkd

echo '
nvram = [
    "/usr/share/ovmf/x64/OVMF_CODE.fd:/usr/share/ovmf/x64/OVMF_VARS.fd"
]' | sudo tee --append /etc/libvirt/qemu.conf

sudo virsh net-define /etc/libvirt/qemu/networks/default.xml

sudo virsh net-autostart default

sudo systemctl restart libvirtd.service

#if no network
#sudo virsh net-start default

#if no boot device found
#under boot options enable SATA

echo "############################################################################################################"
echo "#####################                        FIRST REBOOT                              #####################"
echo "############################################################################################################"
