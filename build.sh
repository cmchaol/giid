
cat <<EOF >  /tmp/stage4.excl
.bash_history
/mnt/*
/tmp/*
/proc/*
/sys/*
/dev/*
EOF

f="stage4_20170822.tar.xz"

tar -X /tmp/stage4.excl -c / | xz -7vT0  > /dev/$f

curl --upload-file  /dev/$f https://transfer.sh/$f
