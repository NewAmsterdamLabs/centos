#!/bin/bash -eux

# Reinstall gcc so we can use the vbguest plugin for vagrant
echo "==> Reinstall gcc"
yum -y install gcc
