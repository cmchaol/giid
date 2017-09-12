#!/bin/bash

mkdir /dev/tmp 
# sed -i 's/USE="/USE="udev xattr mmx sse sse2/' /etc/portage/make.conf 
echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
echo FEATURES="buildpkg" >> /etc/portage/make.conf

echo "app-emulation/qemu sdl" > /etc/portage/package.use/qemu
echo "media-libs/libsdl X" > /etc/portage/package.use/libsdl

qemu

time \
emerge \
       app-emulation/qemu

# sed -i '/USE=/d' /etc/portage/make.conf 
sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 
sed -i '/FEATURES/d' /etc/portage/make.conf
