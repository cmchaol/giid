#!/bin/bash

mkdir /dev/tmp /usr/portage
emerge-webrsync
echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
sed -i 's/USE="/USE="udev xattr /' /etc/portage/make.conf 

time \
emerge --changed-use --deep @world  

echo "sys-kernel/hardened-sources symlink" >> /etc/portage/package.use/hardened-sources

emerge \
       =sys-kernel/hardened-sources-4.4.8-r1 \
       --autounmask-write 

yes | etc-update --automode -3  

emerge \
       =sys-kernel/hardened-sources-4.4.8-r1 

f1=https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker448-20170904.defconfig

cd /usr/src/linux
wget -O /tmp/defconfig $f1
make KCONFIG_ALLCONFIG=/tmp/defconfig alldefconfig

time \
make  && make modules_install


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


sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 

rm -rf /dev/tmp /usr/portage
