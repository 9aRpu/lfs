#!/bin/bash
export LFS=/mnt/lfs
export LFS_TGT=x86_64-lfs-linux-gnu
export LFS_DISK=/dev/sdb

# Check if mountingpoint exists
[[ -d $LFS ]] || sudo mkdir $LFS

# Check if disk is mounted
if ! grep -q "$LFS" /proc/mounts; then
    source setupdisk.sh
    sudo mount "${LFS_DISK}2" "$LFS"
    sudo chown -v $USER "$LFS"
fi

# Create directory structure
mkdir -pv $LFS/{sources,tools,boot,etc,bin,lib,sbin,usr,var}

# Create the lib64 dir if we are on a 64-bit system
case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64;;
esac