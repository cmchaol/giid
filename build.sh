
echo ">=sys-kernel/hardened-sources-4.8.17-r2:4.8.17-r2" > /etc/portage/package.mask/hardened-sources

echo "app-editors/emacs xft X jpeg png svg tiff alsa gif imagemagick sound" > /etc/portage/package.use/emacs

emerge \
       sys-kernel/hardened-sources \
       x11-base/xorg-drivers \
       x11-base/xorg-server \
       x11-apps/xrandr \
       x11-terms/xterm \
       x11-wm/spectrwm \
       app-editors/emacs \
       --autounmask-write 

yes | etc-update --automode -3

emerge \
       sys-kernel/hardened-sources \
       x11-base/xorg-drivers \
       x11-base/xorg-server \
       x11-apps/xrandr \
       x11-terms/xterm \
       x11-wm/spectrwm \
       app-editors/emacs
