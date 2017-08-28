
mkdir /dev/tmp

# echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf


sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 

emerge --autounmask-write www-client/google-chrome

yes | etc-update --automode -3  

emerge www-client/google-chrome
