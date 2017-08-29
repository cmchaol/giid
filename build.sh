
mkdir /dev/tmp


# echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 

emerge \
       =sys-kernel/hardened-sources-4.4.8-r1

f1=https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker448-sm-cp-tm-fu-ev-mu-us-fs-ne-ud-x-go-do-qe-ms-20170829.defconfig

cd /usr/src/linux


wget -O /tmp/defconfig $f1

make KCONFIG_ALLCONFIG=/tmp/defconfig alldefconfig


time \
make  && make modules_install


cat <<EOF >  /dev/tmp/stage4.excl
.bash_history
/mnt/*
/tmp/*
/proc/*
/sys/*
/dev/*
EOF

f2="stage4_v103_20170829.tar.xz"

tar -X /dev/tmp/stage4.excl -c / | xz -2vT0  > /dev/tmp/$f2

wget --method PUT --body-file=/dev/tmp/$f2 https://transfer.sh/$f2 -O - -nv



sed -i 's/^PORTAGE_TMPDIR/# PORTAGE_TMPDIR/g' /etc/portage/make.conf
