
mkdir /dev/tmp

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

emerge \
       net-misc/proxychains \
       net-misc/dhcpcd \
       net-misc/autossh \
       net-misc/keychain \
       sys-boot/grub \
       app-misc/mc \
       dev-vcs/git
       dev-util/re2c \
       dev-util/ninja \
       app-arch/libarchive \
       net-misc/curl \
       dev-libs/libuv \
       dev-util/cmake
