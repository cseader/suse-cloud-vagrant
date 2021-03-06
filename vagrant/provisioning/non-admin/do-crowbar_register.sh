#!/bin/bash

set -e

admin_ip="$1"

export PATH="$PATH:/sbin:/usr/sbin/"
zypper ar http://${admin_ip}:8091/suse-11.3/install sles11-sp3
until [ -f crowbar_register ]; do
    wget http://${admin_ip}:8091/suse-11.3/crowbar_register
done
chmod a+x crowbar_register
./crowbar_register --force --interface eth1 --gpg-auto-import-keys --no-gpg-checks
