
mkdir /dev/tmp


mkdir /usr/portage


echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
# sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 


echo "sys-kernel/hardened-sources symlink" >> /etc/portage/package.use/hardened-sources


emerge-webrsync


emerge \
       sys-boot/grub \
       net-misc/proxychains \
       net-misc/dhcpcd \
       net-misc/autossh \
       net-misc/keychain \
       app-misc/mc \
       dev-vcs/git \
       sys-fs/squashfs-tools 


#       =sys-kernel/hardened-sources-4.4.8-r1 \


cat <<EOF >  /etc/conf.d/net
dns_domain_lo="my_domain"
config_enp1s0="dhcp"
EOF

emerge --noreplace net-misc/netifrc

sed -i 's/^PORTAGE_TMPDIR/# PORTAGE_TMPDIR/g' /etc/portage/make.conf
