
# mandatory
mkdir /dev/tmp   

# sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 

# cat /etc/portage/make.conf | grep PORTAGE_TMPDIR


# f=https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker4710-sm-cp-tm-fu-ev-mu-us-fs-ne-ud-x-go-20170822.config


f1=https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker4710-sm-cp-tm-fu-ev-mu-us-fs-ne-ud-x-go-20170822.defconfig


cd /usr/src/linux

# wget -O .config $f

wget -O /tmp/defconfig $f1


# make KCONFIG_ALLCONFIG=$f alldefconfig

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

f2="stage4_20170828.tar.xz"

tar -X /dev/tmp/stage4.excl -c / | xz -2vT0  > /dev/tmp/$f2

wget --method PUT --body-file=/dev/tmp/$f2 https://transfer.sh/$f2 -O - -nv
