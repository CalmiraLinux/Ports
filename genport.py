#!/usr/bin/python3

import os
import sys
import subprocess

DATA = "/home/administrator/Work/Ports/ports/base/"
PORT = sys.argv[1]

PORT = DATA + PORT

if not os.path.isdir(PORT):
    pass
else:
    exit(1)

install = """#!/bin/bash
set -Eeuo pipefail
cd /usr/src/

"""

config = """{
    "name": "",
    "version": "",
    "description": "",
    "site": "",
    "maintainer": "",
    "priority": ""
}
"""

resources = """{
    "resources": {
        "url": "",
        "file": ""
    }
}
"""

os.makedirs(PORT)

f = open(PORT+"/install", "w")
f.write(install)
f.close()

f = open(PORT+"/config.json", "w")
f.write(config)
f.close()

f = open(PORT+"/resources.conf", "w")
f.write(resources)
f.close()

subprocess.run(f"vim {PORT+'/config.json'}", shell=True)
subprocess.run(f"vim {PORT+'/resources.conf'}", shell=True)
subprocess.run(f"vim {PORT+'/install'}", shell=True)
