
# PORTAGE_TMPDIR
mkdir /dev/tmp


sed -i 's/USE="/USE="udev /g' /etc/portage/make.conf 

emerge --changed-use --deep @world 

rc-update add udev sysinit


f=https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker4710-sm-cp-tm-fu-ev-mu-us-fs-ne-ud-x-go-20170822.config

cd /usr/src/linux

wget -O .config $f

time \
make  && make modules_install
