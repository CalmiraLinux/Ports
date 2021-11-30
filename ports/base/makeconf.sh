#!/bin/bash
# Инструментарий для создания
# config.sh для порта
# (C) Linuxoid85, 2021 для Calmira LX4 1.1

if [ -d $1 ]; then
	touch $1/config.sh
elif [ $1 = "Package" ]; then
	echo "Вы остановились на пакете:"
	cat .conf
	exit 0
else
	echo "ОШИБКА: пакета $1 не существует."
	exit 1
fi

echo "{
    \"name\": \"$1\",
    \"version\": \"\",
    \"description\": \"\",
    \"site\": \"\",
    \"maintainer\": \"Linuxoid85 <linuxoid85@gmail.com>\",
    \"priority\": \"system\",
    \"release\": \"1.1\",
    \"deps\": {
    	\"\"
    },
    \"bins\": \"\",
    \"dirs\": \"\",
    \"libs\": \"\"
}" > $1/config.json
vim $1/config.json

if [ $1 != "Package" ]; then
	echo "$1" > .conf
fi
