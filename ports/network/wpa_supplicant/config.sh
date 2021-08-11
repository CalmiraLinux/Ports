NAME="wpa_supplicant"
VERSION="2.9"
PRIORITY="user"
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
DESCRIPTION="WPA Supplicant is a Wi-Fi Protected Access (WPA) client and IEEE 802.1X supplicant. It implements WPA key negotiation with a WPA Authenticator and Extensible Authentication Protocol (EAP) authentication with an Authentication Server. In addition, it controls the roaming and IEEE 802.11 authentication/association of the wireless LAN driver. This is useful for connecting to a password protected wireless access point."
RECOM_DEPS="desktop-file-utils-0.26 (for running 'update-desktop-database') libnl-3.5.0"
OPT_DEPS="dbus-1.12.20 libxml2-2.9.10 Qt-5.15.0"
FILES="$(which wpa_supplicant) $(which wpa_passphrase) $(which wpa_cli)"
