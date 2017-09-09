#!/bin/bash

mkdir /dev/tmp /usr/portage
sed -i 's/USE="/USE="udev xattr /' /etc/portage/make.conf 
echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
echo FEATURES="buildpkg" >> /etc/portage/make.conf


time \
emerge \
       dev-util/re2c \
       dev-util/ninja \
       dev-libs/libuv \
       app-arch/libarchive \
       dev-util/cmake 


sed -i '/USE=/d' /etc/portage/make.conf 
sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 
sed -i '/FEATURES/d' /etc/portage/make.conf
