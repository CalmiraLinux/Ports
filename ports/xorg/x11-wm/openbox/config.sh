NAME=openbox
VERSION=3.6.1
PRIORITY="user"
DESCRIPTION="Openbox is a highly configurable desktop window manager with extensive standards support. It allows you to control almost every aspect of how you interact with your desktop."
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
REQ_DEPS="x11-minimal pango-1.46.0 (compiled with support for libXft)"
OPT_DEPS="dbus-1.12.20 (runtime) imlib2-1.7.0 (to enable icons in the right click menu)"
FILES="$(which gdm-control) $(which gnome-panel-control) $(which obxprop) $(which openbox) $(which openbox-gnome-session) $(which openbox-kde-session) $(which openbox-session) /usr/lib/{libobrender,libobt}.so /etc/xdg/openbox /usr/include/openbox /usr/share/doc/openbox-3.6.1"
