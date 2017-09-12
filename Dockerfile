
FROM c5766/giid:q12
# FROM gentoo/stage3-amd64-hardened

ADD build.sh /

RUN /build.sh
