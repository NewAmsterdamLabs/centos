#!/bin/bash -eux
if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then

    # Remove old kernel
    echo "==> Removing old kernel"
    yum -y remove kernel kernel-{headers,devel,tools,tools-libs}

    echo "==> Adding kernel devel"
    # Add new kernel extras
    yum -y --enablerepo=elrepo-kernel install kernel-ml-{headers,devel,tools,tools-libs}

  fi
