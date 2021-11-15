NAME=WT
VERSION="29"
PRIORITY="user"
DESCRIPTION="The Wireless Extension (WE) is a generic API in the Linux kernel allowing a driver to expose configuration and statistics specific to common Wireless LANs to user space. A single set of tools can support all the variations of Wireless LANs, regardless of their type as long as the driver supports Wireless Extensions. WE parameters may also be changed on the fly without restarting the driver (or Linux).

The Wireless Tools (WT) package is a set of tools allowing manipulation of the Wireless Extensions. They use a textual interface to support the full Wireless Extension."
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
FILES="$(which ifrename) $(which iwconfig) $(which iwevent) $(which iwgetid) $(which iwlist) $(which iwpriv) $(which iwspy) /usr/lib/libiw.so"
