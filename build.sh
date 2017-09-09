#!/bin/bash

mkdir /dev/tmp 
# sed -i 's/USE="/USE="udev xattr mmx sse sse2/' /etc/portage/make.conf 
echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
echo FEATURES="buildpkg" >> /etc/portage/make.conf



cat <<EOF >> /etc/portage/make.conf

INPUT_DEVICES="libinput"

VIDEO_CARDS="nouveau intel i915"

PAX_MARKINGS="XT" 
EOF

time \
emerge \
       x11-base/xorg-drivers 


# sed -i '/USE=/d' /etc/portage/make.conf 
sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 
sed -i '/FEATURES/d' /etc/portage/make.conf
