#!/bin/bash

mkdir /dev/tmp /usr/portage

time \
emerge-webrsync

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

time \
emerge \
       dev-util/re2c \
       dev-util/ninja \
       app-arch/libarchive \
       dev-libs/libuv \
       dev-util/cmake 


sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 

rm -rf /dev/tmp /usr/portage
