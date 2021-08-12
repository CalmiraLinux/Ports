NAME=libsecret
VERSION=0.20.3
PRIORITY="user"
PORT="true"
DESCRIPTION="The libsecret package contains a GObject based library for accessing the Secret Service API."
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
REQ_DEPS="GLib-2.64.4"
RECOM_DEPS="gobject-introspection-1.64.1 libgcrypt-1.8.6 vala-0.48.9"
OPT_DEPS="gtk-doc-1.32 docbook-xml-4.5 docbook-xsl-1.79.2 libxlst-1.1.34 (to build manual pages) valgrind-3.16.1 (can be used in tests)"
RUN_DEPS="gnome-keyring-3.36.0"
FILES="$(which secret-tool) /usr/lib/libsecret-1.so /usr/include/libsecret-1 /usr/share/gtk-doc/html/libsecret-1"