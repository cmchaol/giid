#!/bin/bash

mkdir /dev/tmp

cat <<EOF >  /dev/tmp/stage4.excl
.bash_history
/mnt/*
/tmp/*
/proc/*
/sys/*
/dev/*
/usr/portage/*
EOF

f="q12_20170913-2.tar.xz"

tar -X /dev/tmp/stage4.excl -c / | xz -2vT0  > /dev/tmp/$f

wget --method PUT --body-file=/dev/tmp/$f https://transfer.sh/$f -O - -nv
