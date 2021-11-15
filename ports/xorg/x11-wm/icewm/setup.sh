#!/bin/bash
# IceWM configuration script
# (C) Michail Linuxoid85 Krasnov <linuxoid85@gmail.com>
# For Calmira 2021.5 (LX4 1.1) GNU/Linux

mkdir -v ~/.icewm                                       &&
cp -v /usr/share/icewm/keys ~/.icewm/keys               &&
cp -v /usr/share/icewm/menu ~/.icewm/menu               &&
cp -v /usr/share/icewm/preferences ~/.icewm/preferences &&
cp -v /usr/share/icewm/toolbar ~/.icewm/toolbar         &&
cp -v /usr/share/icewm/winoptions ~/.icewm/winoptions

icewm-menu-fdo >~/.icewm/menu
