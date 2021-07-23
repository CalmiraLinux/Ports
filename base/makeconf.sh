#!/bin/bash
# Инструментарий для создания
# config.sh для порта
# (C) Linuxoid85, 2021 для Calmira LX4 1.1

if [ -d $1 ]; then
	touch $1/config.sh
else
	echo "ОШИБКА: пакета $1 не существует."
	exit 1
fi

echo "NAME=$1
VERSION=
DESCRIPTION=
SITE=
MAINTAINER=Linuxoid85
PRIORITY=system" > $1/config.sh
vim $1/config.sh
