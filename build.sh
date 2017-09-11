#!/bin/bash

mkdir /dev/tmp 
# sed -i 's/USE="/USE="udev xattr mmx sse sse2/' /etc/portage/make.conf 
echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
echo FEATURES="buildpkg" >> /etc/portage/make.conf


emerge --autounmask-write www-client/google-chrome

yes | etc-update --automode -3  

time \
emerge www-client/google-chrome


# sed -i '/USE=/d' /etc/portage/make.conf 
sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 
sed -i '/FEATURES/d' /etc/portage/make.conf
