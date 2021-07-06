#!/bin/bash
#
# Скрипт для создания порта
#

## Использование:
# makeport $PACKAGE
# $PACKAGE - имя пакета

if [ -z $1 ]; then
	yad --title="Ошибка" --text="Не введено имя программы"
	exit 0
fi

mkdir $1
cd $1
touch install
chmod +x install
echo "#!/bin/bash
# Build package $1 from port
# Port created by Linuxoid85
#
# (C) 2021 Michail [Linuxoid85] Krasnov <linuxoid85@gmail.com>

cd /usr/src

wget 
tar -xf 
cd 
" > install
gedit install
cd ../
