#!/bin/bash

echo
echo "     ####################################################"
echo "          This script is used to create a swap file"
echo "     Use table below to dertemine how much swap is needed"
echo "                  Open file for instructions"
echo "     ####################################################"
echo
echo "       RAM   No hibernation    With Hibernation  Maximum"
echo "     256MB            256MB               512MB    512MB"
echo "     512MB            512MB              1024MB   1024MB"
echo "    1024MB           1024MB              2048MB   2048MB"
echo
echo "       RAM   No hibernation    With Hibernation  Maximum"
echo "       1GB              1GB                 2GB      2GB"
echo "       2GB              1GB                 3GB      4GB"
echo "       3GB              2GB                 5GB      6GB"
echo "       4GB              2GB                 6GB      8GB"
echo "       5GB              2GB                 7GB     10GB"
echo "       6GB              2GB                 8GB     12GB"
echo "       8GB              3GB                11GB     16GB"
echo "      12GB              3GB                15GB     24GB"
echo "      16GB              4GB                20GB     32GB"
echo

# edit count below with desired swap file size in mb
#sudo dd if=/dev/zero of=/swapfile bs=1M count=512 status=progress

# set permissions
#sudo chmod 600 /swapfile

# format partition to swap
#sudo mkswap /swapfile

#Activate the swap file
#sudo swapon /swapfile

# add "/swapfile none swap defaults 0 0" in location below
#sudo nano /etc/fstab

#check swappiness value
#sysctl vm.swappiness

#To set the swappiness value permanently, create a sysctl.d(5) configuration file. For example:
#nano /etc/sysctl.d/99-swappiness.conf
#vm.swappiness=10
          
#    1 GB	 1,024 MB
#    2 GB    2,048 MB
#    3 GB    3,072 MB
#    4 GB	 4,096 MB
#    5 GB	 5,120 MB
#    6 GB	 6,144 MB
#    7 GB	 7,168 MB
#    8 GB	 8,192 MB
#    9 GB	 9,216 MB
#   10 GB	10,240 MB
#   11 GB	11,264 MB
#   12 GB	12,288 MB
#   13 GB	13,312 MB
#   14 GB	14,336 MB
#   15 GB	15,360 MB
#   16 GB	16,384 MB
#   17 GB	17,408 MB
#   18 GB	18,432 MB
#   19 GB	19,456 MB
#   20 GB	20,480 MB