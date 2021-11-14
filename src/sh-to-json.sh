#!/bin/bash
# Скрипт для конвертации конфига
# порта из формата cpkg в формат port-utils

if [ -f "$1/config.json" ]; then
	echo "В пакете порта '$1' уже присутствует config.json"
	exit 1
fi

if [ -f "$1/config.sh" ]; then
	cd $1
	source config.sh
else
	echo "Ошибка: файла '$1/config.sh' не найдено."
	exit 1
fi

config="{
    \"name\": \"$NAME\",
    \"version\": \"$VERSION\",
    \"description\": \"$DESCRIPTION\",
    \"site\": \"$SITE\",
    \"maintainer\": \"$MAINTAINER\",
    \"priority\": \"$PRIORITY\",
    \"deps\": {
        \"required\": [
            \"$REQ_DEPS\"
        ],
        \"runtime\": [
            \"$RUN_DEPS\"
        ],
        \"test\": [
            \"$TEST_DEPS\"
        ],
        \"optional\": [
            \"$OPT_DEPS\"
        ],
        \"before\": [
            \"$BEF_DEPS\"
        ],
        \"conflict\": [
            \"$CON_DEPS\"
        ]
    }
}"

echo "$config" > 'config.json'
