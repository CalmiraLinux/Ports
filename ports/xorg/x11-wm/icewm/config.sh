NAME=icewm
VERSION=1.8.0
PRIORITY="user"
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
DESCRIPTION="IceWM is a window manager with the goals of speed, simplicity, and not getting in the user's way."
REQ_DEPS="x11-minimal gdk-pixbuf-2.40.0"
OPT_DEPS="FriBidi-1.0.9 (for languages written right to left) librsvg-2.48.8 libsndfile-1.0.28 alsa-lib-1.2.3.2 (for the experimental icesound program)"
FILES="$(which icehelp) $(which icesh) $(which icesound) $(which icewm) $(which icewm-menu-fdo) $(which icewm-session) $(which icewm-set-gnomewm) $(which icewmbg) $(which icewmhint) $(which icewmtray) /usr/share/doc/icewm-1.8.0 /usr/share/icewm"
