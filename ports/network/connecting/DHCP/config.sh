NAME=DHCP
VERSION="4.4.2"
DESCRIPTION="The ISC DHCP package contains both the client and server programs for DHCP. dhclient (the client) is used for connecting to a network which uses DHCP to assign network addresses. dhcpd (the server) is used for assigning network addresses on private networks."
PRIORITY="user"
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
FILES="$(which dhclient) $(which dhclient-script) $(which dhcpd) $(which  dhcrelay) $(which omshell) /usr/lib/{libdhcpctl,libomapi}.a /etc/dhcp /usr/include/dhcpctl  /usr/include/isc-dhcp /usr/include/omapip /var/lib/dhclient /var/lib/dhcpd"
