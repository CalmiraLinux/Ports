#!/usr/bin/python3
# Скрипт для генерации Markdown-страницы с информацией
# о пакете порта. Впоследствии эти страницы будут
# использованы в документации системы портов дистрибутива.
# (C) 2021 Михаил Краснов <linuxoid85@gmail.com>
# Для CalmiraLinux 1.1
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# Project Page: https://github.com/CalmiraLinux/Ports
# Michail Krasnov <linuxoid85@gmail.com>
#

import os
import sys
import json

DIR = "/home/administrator/Work/Ports/ports/"

class settings():
    """
    Класс предназначен для получения значений параметров
    конфига указанного порта.
    """

    config = DIR + sys.argv[1] + "/config.json"

    def get(param) -> str:
        """
        Функция для получения значений параметров файла config.json.
        Предназначено для всего, кроме описания зависимостей.

        Использование:
        `settings.get(param)`

        `param` - требуемый параметр.
        """

        try:
            f = open(settings.config, "r")
        except:
            print("\"settings.get()\": файла {} не существует!".format(settings.config))
            exit(1)

        data = json.load(f)

        try:
            return str(data[param])
        except KeyError:
            return "Параметры не предоставлены"
            
    def get_dep(param):
        """
        Функция для получения значений параметров секции "deps" файла
        config.json.

        Использование:
        `settings.get_dep(param)`

        `param` - требуемый параметр.
        """

        try:
            f = open(settings.config, "r")
        except:
            print("\"settings.get_dep()\": файла {} не существует!".format(settings.config))
            exit(1)

        data = json.load(f)

        f.close()
        try:
            return data["deps"][param]
        except KeyError:
            return "Параметры не предоставлены"
        
class gen():
    """
    В этом классе содержатся функции для генерации
    markdown-страницы на основе данных, полученных
    из файла config.json указанного порта.
    """

    md = DIR + sys.argv[1] + "/README.md"
    config = settings.config

    def write(text):
        """
        Записывает в файл определённую информацию.

        Использование:

        `gen.write(text)`

        `text` - нужная информация.
        """
        
        try:
            f = open(gen.md, "a")
        except FileNotFoundError:
            print("\"gen.write()\": файл {} не существует".format(gen.md))
            exit(1)
        
        f.write(text)
        f.write("\n")
        f.close()

    def gen():
        """
        Генерирует markdown-страницу
        """

        # Создаёт файл и записывает заголовок
        f = open(gen.md, "w")

        name = settings.get("name")
        version = settings.get("version")
        header = "# " + name + "-" + version + "\n"
        f.write(header+"\n")
        f.close()

        # Запись другой информации
        gen.write(settings.get("description"))
        gen.write("\n* **Сопровождающий:** "+settings.get("maintainer"))
        gen.write("* **Домашняя страница:** "+settings.get("site"))
        gen.write("* **Приоритет:** "+settings.get("priority"))

        # Запись информации о зависимостях
        gen.write("\n## Зависимости:\n")
        gen.write("* **Необходимые:** "+settings.get_dep("required"))
        gen.write("* **Runtime:** "+settings.get_dep("runtime"))
        gen.write("* **Для тестирования:** "+settings.get_dep("test"))
        gen.write("* **Опциональные:** "+settings.get_dep("optional"))
        gen.write("* **Рекомендуемые:** "+settings.get_dep("recommend"))
        gen.write("* **Перед ним:** "+settings.get_dep("before"))
        gen.write("* ***Конфликтует с:*** "+settings.get_dep("conflict"))

        # Запись информации об установленных файлах
        gen.write("\n## Установленные файлы:\n")
        gen.write("* **Установленные программы:** "+settings.get("bins"))
        gen.write("* **Установленные библиотеки:** "+settings.get("libs"))
        gen.write("* **Установленные директории:** "+settings.get("dirs"))

gen.gen()
