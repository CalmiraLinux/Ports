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
	# В файле '.config' описаны некоторые переменные,
	# такие как $AUTHOR.
	if [ -f ".config" ]; then
		. .config
	else
		export AUTHOR="Uknown author"
	fi
else
	export AUTHOR="$2"
fi

# Просмотр последнего собранного пакета
if [ $1 = "last_pkg" ]; then
	if [ -f ".package" ]; then
		echo "Последний собранный порт: "
		cat .package
		exit 0
	else
		echo "Не могу найти файл \".package\", в котором записан последний собранный порт!"
		exit 1
	fi
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

cd /usr/src

VERSION=\"\" # Version of $1

wget 
tar -xf 
cd 
" > install
echo "Создание порта..."
$EDITOR install

echo "Запись информации о пакете..."

source install
echo "NAME=\"$1\"
VERSION=\"$VERSION\"
PRIORITY=\"user\"
PORT=\"true\"
MAINTAINER=\"$AUTHOR\"
" > config.sh
$EDITOR config.sh
cd ..

unset AUTHOR
echo "$1-$VERSION" > .package

exit 0
