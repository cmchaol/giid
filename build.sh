
mkdir /dev/tmp

# to accelerate portage building in tmpfs
echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf  

emerge \
       net-fs/cifs-utils \
       sys-fs/squashfs-tools \
       net-fs/curlftpfs \
       =sys-kernel/hardened-sources-4.4.8-r1 

f1=https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker448-20170901.defconfig

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

f2="stage4_20170901.tar.xz"

tar -X /dev/tmp/stage4.excl -c / | xz -2vT0  > /dev/tmp/$f2

wget --method PUT --body-file=/dev/tmp/$f2 https://transfer.sh/$f2 -O - -nv

sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf # restore to default
