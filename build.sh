
mkdir -p /etc/portage/package.mask/

echo ">=sys-kernel/hardened-sources-4.8.17-r2:4.8.17-r2" > /etc/portage/package.mask/hardened-sources

# udev, video cards, X, 

sed -i 's/USE="/USE="udev xattr /' /etc/portage/make.conf 

cat <<EOF >> /etc/portage/make.conf

INPUT_DEVICES="libinput"

VIDEO_CARDS="nouveau intel i915"

PAX_MARKINGS="XT" 

EOF


emerge --changed-use --deep @world 

rc-update add udev sysinit



cat <<EOF >  /etc/conf.d/net

dns_domain_lo="my_domain"

config_enp1s0="dhcp"

EOF


cd /etc/init.d
ln -s net.lo net.enp1s0
rc-update add net.enp1s0 default

emerge --noreplace net-misc/netifrc


echo "sys-kernel/hardened-sources symlink" >> /etc/portage/package.use/hardened-sources

echo "app-editors/emacs xft X jpeg png svg tiff alsa gif imagemagick sound" > /etc/portage/package.use/emacs

emerge \
       sys-kernel/hardened-sources \
       x11-base/xorg-drivers \
       x11-base/xorg-server \
       x11-apps/xrandr \
       x11-terms/xterm \
       x11-wm/spectrwm 
       app-editors/emacs 

emerge --autounmask-write app-editors/emacs 

yes | etc-update --automode -3

emerge app-editors/emacs 

# emerge --autounmask-write www-client/google-chrome

# yes | etc-update --automode -3

# emerge www-client/google-chrome
