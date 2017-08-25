
mkdir /dev/tmp

# echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf

echo "app-editors/emacs xft X jpeg png svg tiff gif imagemagick" > /etc/portage/package.use/emacs

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
