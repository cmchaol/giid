
mkdir /dev/tmp


echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
# sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 


echo "sys-kernel/hardened-sources symlink" >> /etc/portage/package.use/hardened-sources


emerge \
       =sys-kernel/hardened-sources-4.4.8-r1 


f1=https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker448-20170901.defconfig

cd /usr/src/linux
wget -O /tmp/defconfig $f1
make KCONFIG_ALLCONFIG=/tmp/defconfig alldefconfig


sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf
