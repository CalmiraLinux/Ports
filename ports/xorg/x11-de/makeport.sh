#!/bin/bash
#
# Скрипт для создания порта
#

## Использование:
# makeport $PACKAGE $AUTHOR
# $PACKAGE - имя пакета
# $AUTHOR - автор порта

if [ -z $1 ]; then
	if [ -z $DISPLAY ]; then
		echo -e "\e[1;31mНе введено имя программы\e[0m"
	else
		yad --title="Ошибка" --text="Не введено имя программы"
	fi
	exit 1
fi

if [ -z $EDITOR ]; then
	if [ -f "/usr/bin/vim" ]; then
		export $EDITOR="/usr/bin/vim"
	else
		echo -e "\e[1;31mНе установлена переменная \$EDITOR, не установлен текстовый редактор vim! \e[0m"
		exit 1
	fi
fi

if [ -z $2 ]; then
	export AUTHOR="Uknown author"
else
	export AUTHOR="$2"
fi

mkdir $1
cd $1
touch {install,config.sh}
chmod +x *
echo "Открывается файл 'install'"
echo "#!/bin/bash
# Build package $1 from port
# Port created by $AUTHOR
#
# (C) 2021 Michail [Linuxoid85] Krasnov <linuxoid85@gmail.com>

source /usr/lib/cpkg/other-functions.sh
cd /usr/src

wget 
tar -xf 
cd 
" > install
echo "Создание порта..."
$EDITOR install
echo "Запись информации о пакете..."
$EDITOR config.sh
cd ..

unset AUTHOR
exit 0
