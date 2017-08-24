
mkdir /dev/tmp

sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 

sed -i 's/USE="/USE="udev xattr /' /etc/portage/make.conf 

cat <<EOF >> /etc/portage/make.conf

INPUT_DEVICES="libinput"

VIDEO_CARDS="nouveau intel i915"

PAX_MARKINGS="XT" 

EOF


emerge --changed-use --deep @world 


emerge \
       x11-base/xorg-drivers
