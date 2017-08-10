
FROM gentoo/stage3-amd64-hardened

RUN mkdir /usr/portage; \
    emerge-webrsync; \
    emerge net-misc/proxychains
