#!/bin/bash
(echo "o"; echo "n"; echo "p"; echo "1"; echo ""; echo "+100M"; echo "a"; echo "n"; echo "p"; echo "2"; echo ""; echo ""; sleep 3; echo "w"; echo "q") | sudo fdisk "$LFS_DISK"
sudo mkfs.ext4 "${LFS_DISK}1"
sudo mkfs.ext4 "${LFS_DISK}2"