
FROM c5766/giid:v39
# FROM gentoo/stage3-amd64-hardened

ADD build.sh /

RUN /build.sh
