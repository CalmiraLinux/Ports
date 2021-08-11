NAME=gpm
VERSION=1.20.7
PRIORITY="user"
DESCRIPTION="The GPM (General Purpose Mouse daemon) package contains a mouse server for the console and xterm. It not only provides cut and paste support generally, but its library component is used by various software such as Links to provide mouse support to the application."
MAINTAINER="Linuxoid85 <linuxoid85@gmail.com>"
FILES="$(which disable-paste) $(which display-buttons) $(which display-coords) $(which get-versions) $(which gpm) $(which gpm-root) $(which hltest) $(which mev) $(which mouse-test) /usr/lib/libgpm.{so.a} /usr/share/doc/gpm-$VERSION"
