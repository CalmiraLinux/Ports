#!/usr/bin/python3

import os
import sys
import toml
import shutil

conf_data = toml.load('mkport.toml')
years = conf_data['ports']['years']
maintainer = conf_data['ports']['name']
email = conf_data['ports']['email']
releases = conf_data['ports']['releases']

cat = sys.argv[1]
port = sys.argv[2]
vers = sys.argv[3]

INSTALL = f"""#!/bin/bash -e
# Build script for '{port}' port
# Copyright (C) 2022 Michail Krasnov <linuxoid85@gmail.com>

NAME="{port}"
VERSION="{vers}"

cd /usr/src/"$NAME-$VERSION"

"""

CONF = f"""[package]
name         = "{port}"
version      = "{vers}"
description  = ""
maintainer   = "{maintainer} <{email}>"
releases     = {releases}
priority     = ""
usage        = 
upgrade_mode = ""
build_time   = 

[deps]
required  = []
recommend = []
optional  = []
conflict  = []

[port]
url  = ""
file = ""
md5  = ""
"""

port = f"ports/{cat}/{port}"

if os.path.isdir(port):
    shutil.rmtree(port)

os.makedirs(port)

with open(f"{port}/install", 'w') as f:
    f.write(INSTALL)

with open(f"{port}/port.toml", 'w') as f:
    f.write(CONF)

os.system(f'nvim {port}/install')
os.system(f'nvim {port}/port.toml')
