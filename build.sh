
# mandatory
mkdir /dev/tmp   

sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 

cat /etc/portage/make.conf | grep PORTAGE_TMPDIR

emerge \
       =sys-kernel/hardened-sources-4.4.8-r1
