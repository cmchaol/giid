
FROM c5766/giid:x20
# FROM gentoo/stage3-amd64-hardened

ADD build.sh /

RUN /build.sh
