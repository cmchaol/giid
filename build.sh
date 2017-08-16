
echo "app-editors/emacs xft X jpeg png svg tiff alsa gif imagemagick" > /etc/portage/package.use/emacs

emerge \
       app-editors/emacs \
       --autounmask-write 

yes | etc-update --automode -3

emerge \
       app-editors/emacs
