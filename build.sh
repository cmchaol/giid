
f="https://raw.githubusercontent.com/cmchaol/gimw/master/my-kernel-defconfig/ker448-20170727-1425"; \
wget -O /usr/src/linux/.config $f; \
cd /usr/src/linux; \
make && make modules_install; \
KERNELVER=4.7.10-hardened; \
EXTENSION=20170818; \
cp .config /boot/config-${KERNELVER}-${EXTENSION}; \
cp System.map /boot/System.map-${KERNELVER}-${EXTENSION}; \
cp arch/x86_64/boot/bzImage /boot/kernel-${KERNELVER}-${EXTENSION}; \
cp -a .config ../${KERNELVER}-${EXTENSION}.config.bk; \
