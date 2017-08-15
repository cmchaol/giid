
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

FEATURES="test"

EOF


emerge --changed-use --deep @world 

rc-update add udev sysinit



cat <<EOF >  /etc/conf.d/net

dns_domain_lo="my_domain"

config_enp1s0="dhcp"

EOF

mkdir /usr/portage/env

cat <<EOF >  /etc/portage/env/compiler-clang  
CC="clang"
CXX="clang++"
CFLAGS="${CFLAGS} -flto=thin"              
CXXFLAGS="${CXXFLAGS} -flto=thin"          
LDFLAGS="-Wl,-O2 -Wl,--as-needed"    #please use whichever optimization level you're comfortable with
EOF

cat <<EOF > /etc/portage/env/compiler-gcc
CC="gcc"
CXX="g++"
CFLAGS="-O2 -pipe"
CXXFLAGS="${CFLAGS}"
EOF


cat <<EOF > /etc/portage/package.env
sys-devel/llvm compiler-clang  
EOF


cd /etc/init.d
ln -s net.lo net.enp1s0
rc-update add net.enp1s0 default

emerge --noreplace net-misc/netifrc

echo "sys-devel/llvm gold clang" > /etc/portage/package.use/llvm



emerge sys-devel/binutils-config

binutils-config --linker ld.gold

emerge \
       dev-util/re2c \
       dev-util/ninja \
       app-arch/libarchive \
       net-misc/curl \
       dev-libs/libuv \
       dev-util/cmake \
       sys-devel/clang
