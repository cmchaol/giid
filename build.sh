
#!/bin/bash

mkdir /usr/portage

emerge-webrsync

emerge \
       net-misc/proxychains \
       net-misc/dhcpcd \
       net-misc/autossh \
       net-misc/keychain \
       sys-boot/grub \
       app-misc/mc \
       dev-vcs/git
