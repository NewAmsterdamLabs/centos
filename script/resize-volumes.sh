#!/bin/bash -eux

# resize home volume
echo "==> Resizing the home volume..."

tar -czvf /tmp/home.tgz -C /home .
umount -f /dev/mapper/centos-home
lvremove /dev/mapper/centos-home
lvcreate -L 5GB -n home centos
mkfs.xfs /dev/centos/home
mount /dev/mapper/centos-home
lvextend -r -l +100%FREE /dev/mapper/centos-root
tar -xzvf /tmp/home.tgz -C /home

# reboot
echo "Rebooting the machine..."
reboot
sleep 60
