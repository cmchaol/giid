#!/bin/bash

mkdir /dev/tmp /usr/portage

time \
emerge-webrsync

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

time \
emerge \
       sys-boot/grub \
       net-misc/proxychains \
       net-misc/dhcpcd \
       net-misc/autossh \
       net-misc/keychain \
       app-misc/mc \
       dev-vcs/git \
       sys-fs/squashfs-tools \
       net-fs/curlftpfs



sed -i 's/^PORTAGE_TMPDIR/# PORTAGE_TMPDIR/g' /etc/portage/make.conf 

rm -rf /usr/portage
