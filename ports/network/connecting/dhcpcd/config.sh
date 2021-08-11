NAME=dhcpcd
VERSION="9.1.4"
PRIORITY="user"
DESCRIPTION="dhcpcd is an implementation of the DHCP client specified in RFC2131. A DHCP client is useful for connecting your computer to a network which uses DHCP to assign network addresses. dhcpcd strives to be a fully featured, yet very lightweight DHCP client."
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
OPT_DEPS="LVVM-10.0.1 (with Clang) ntp-4.2.8p15 chronyd ypbind"
FILES="$(which dhcpcd) /lib/dhcpcd/dev/udev.so /{,var/}lib/dhcpcd /usr/share/dhcpcd"
