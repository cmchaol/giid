
mkdir /dev/tmp


# echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf


sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 


echo "app-emulation/qemu sdl" > /etc/portage/package.use/qemu

emerge \
       app-emulation/qemu



sed -i 's/^PORTAGE_TMPDIR/# PORTAGE_TMPDIR/g' /etc/portage/make.conf
