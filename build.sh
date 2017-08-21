
mkdir /etc/portage/repos.conf

cat <<EOF >  /etc/portage/repos.conf/gentoo.conf
[gentoo]
location = /dev/portage
EOF

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

emerge-webrsync

echo ">=sys-kernel/hardened-sources-4.8.17-r2:4.8.17-r2" > /etc/portage/package.mask/hardened-sources

emerge \
       sys-kernel/hardened-sources
