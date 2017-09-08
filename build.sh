#!/bin/bash

mkdir /dev/tmp /usr/portage

time \
emerge-webrsync

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

sed -i 's/USE="/USE="udev xattr /' /etc/portage/make.conf 

cat <<EOF >> /etc/portage/make.conf

INPUT_DEVICES="libinput"

VIDEO_CARDS="nouveau intel i915"

PAX_MARKINGS="XT" 

EOF

time \
emerge --changed-use --deep @world 

time \
emerge \
       x11-base/xorg-drivers 


sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 

rm -rf /dev/tmp /usr/portage
