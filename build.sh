
mkdir /dev/tmp

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

echo ">=sys-kernel/hardened-sources-4.8.17-r2:4.8.17-r2" > /etc/portage/package.mask/hardened-sources

emerge \
       sys-kernel/hardened-sources
