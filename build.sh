
mkdir /dev/tmp

sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 

emerge \
       app-emulation/docker

sed -i 's/^PORTAGE_TMPDIR/# PORTAGE_TMPDIR/g' /etc/portage/make.conf
