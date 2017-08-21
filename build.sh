
cat <<EOF >  /tmp/stage4.excl
.bash_history
/mnt/*
/tmp/*
/proc/*
/sys/*
/dev/*
EOF

f="stage4_20170821.tar.xz"

tar -X /tmp/stage4.excl -c / | xz -7vT0  > /tmp/$f

curl --upload-file  /tmp/$f https://transfer.sh/$f
