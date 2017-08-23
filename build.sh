
mkdir /dev/tmp

echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

emerge \
       sys-devel/llvm
