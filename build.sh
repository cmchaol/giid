#!/bin/bash

mkdir /dev/tmp /usr/portage

time \
emerge-webrsync

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

time \
emerge \ 
       emerge sys-devel/llvm 

sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 

rm -rf /dev/tmp /usr/portage
