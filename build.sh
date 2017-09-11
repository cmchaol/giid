#!/bin/bash

mkdir /dev/tmp 
# sed -i 's/USE="/USE="udev xattr mmx sse sse2/' /etc/portage/make.conf 
echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf
echo FEATURES="buildpkg" >> /etc/portage/make.conf

# echo "app-editors/emacs xft X jpeg png svg tiff gif imagemagick" > /etc/portage/package.use/emacs

time \
emerge  \
        dev-libs/lzo \
        media-libs/libpng \
        media-libs/giflib \
        media-libs/tiff \
        net-libs/liblockfile \
        dev-libs/vala-common \
        media-gfx/graphite2 \
        sys-libs/binutils-libs \
        app-eselect/eselect-ctags \
        dev-lang/nasm \
        x11-libs/cairo \
        app-eselect/eselect-emacs \
        media-gfx/imagemagick \
        dev-libs/libcroco \
        x11-libs/gdk-pixbuf \
        media-libs/libjpeg-turbo \
        media-libs/harfbuzz \
        virtual/jpeg \
        x11-libs/pango \
        gnome-base/librsvg 


# sed -i '/USE=/d' /etc/portage/make.conf 
sed -i '/PORTAGE_TMPDIR/d' /etc/portage/make.conf 
sed -i '/FEATURES/d' /etc/portage/make.conf
