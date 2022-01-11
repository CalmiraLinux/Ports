#!/bin/python3
# Скрипт для генерации базы данных с пакетами
# (C) 2021 Michail Linuxoid85 Krasnov <linuxoid85@gmail.com>

import os
import json
import configparser
import sqlite3

CONF = "/etc/gen_port_db.conf"
conf = configparser.ConfigParser()
conf.read(CONF)

DB = conf.get("Program", "path") + conf.get("Program", "db")
