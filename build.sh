
mkdir /dev/tmp


echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
# sed -i 's/# PORTAGE_TMPDIR/PORTAGE_TMPDIR/g' /etc/portage/make.conf 


cat <<EOF >  /dev/tmp/stage4.excl
.bash_history
/mnt/*
/tmp/*
/proc/*
/sys/*
/dev/*
EOF

f2="stage4_20170901.tar.xz"

tar -X /dev/tmp/stage4.excl -c / | xz -2vT0  > /dev/tmp/$f2

wget --method PUT --body-file=/dev/tmp/$f2 https://transfer.sh/$f2 -O - -nv


sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf
