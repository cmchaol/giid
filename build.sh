
#!/bin/bash

mkdir /usr/portage

emerge-webrsync

mkdir -p /etc/portage/package.mask/



# udev, video cards, X, 

sed -i 's/USE="/USE="udev xattr /' /etc/portage/make.conf 

cat <<EOF >> /etc/portage/make.conf

INPUT_DEVICES="libinput"

VIDEO_CARDS="nouveau intel i915"

# PAX_MARKINGS="XT" 

EOF


emerge --changed-use --deep @world 

rc-update add udev sysinit



cat <<EOF >  /etc/conf.d/net

dns_domain_lo="my_domain"

config_enp1s0="dhcp"

EOF


cd /etc/init.d
ln -s net.lo net.enp1s0
rc-update add net.enp1s0 default

emerge --noreplace net-misc/netifrc

emerge \
       dev-util/re2c \
       dev-util/ninja \
       app-arch/libarchive \
       net-misc/curl \
       dev-libs/libuv \
       dev-util/cmake \
       sys-devel/llvm
