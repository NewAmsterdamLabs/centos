#!/bin/bash -eux
if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then

    # Configure the elrepo repository so we can upgrade the kernel to 4.1
    echo "==> Configuring elrepo repository"
    rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
    yum -y install http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

    echo "==> Installing kernel-ml from elrepo"
    yum -y --enablerepo=elrepo-kernel install kernel-ml

    # Grub tweaks - default to latest kernel
    echo "==> Changing grub to boot to latest kernel"
    grub2-set-default 0

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60

fi
