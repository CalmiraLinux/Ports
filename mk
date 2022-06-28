#!/usr/bin/python3

import os
import shutil
import json
import toml
import tarfile

def convert() -> None:
    with open('./metadata.json') as f:
        json_data = json.load(f)
    with open('./metadata.toml', 'w') as f:
        toml.dump(json_data, f)

def mkarch() -> None:
    os.makedirs("./tmp")
    shutil.copytree("./ports", "./tmp/ports")
    shutil.copy("./metadata.toml", "./tmp/metadata.toml")

    with tarfile.open("./ports.txz", "w:xz") as f:
        for file in "metadata.toml", "ports":
            f.add(file, recursive = True)
    
    shutil.rmtree("./tmp")
    os.remove("./metadata.toml")

convert()
mkarch()
