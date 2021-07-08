#!/bin/bash
#
# Скрипт для создания порта
#

## Использование:
# makeport $PACKAGE
# $PACKAGE - имя пакета

if [ -z $1 ]; then
	if [ -z $DESKTOP ]; then
		echo -e "\e[1;31mНе введено имя программы\e[0m"
	else
		yad --title="Ошибка" --text="Не введено имя программы"
	fi
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

source /usr/share/ports/core-functions.sh
cd /usr/src

wget 
tar -xf 
cd 
" > install
echo "Создание порта..."
vim install
echo "Запись информации о пакете..."
vim info
cd ../
