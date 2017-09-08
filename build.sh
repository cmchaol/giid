#!/bin/bash

mkdir /dev/tmp /usr/portage

time \
emerge-webrsync

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf



time\
emerge \
       x11-base/xorg-server \
       x11-apps/xrandr \
       x11-terms/xterm \
       x11-wm/spectrwm 




sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 

rm -rf /dev/tmp /usr/portage
