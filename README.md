# Calmira ports

Ports - система портов дистрибутива Calmira GNU/Linux-libre, в которой
содержатся сборочные инструкции программного обеспечения, одобренного
разработчиками этой системы.

## Стек технологий

- **Менеджер системы портов:** `cport` (находится в разработке);
- **Конфигурация:** TOML, JSON;
- **Языки программирования:** BASH (сборочные инструкции), Python (доп. утилиты
  и скрипты);

## TODO

- [ ] Добавить все основные пакеты базовой системы;
- [ ] Добавить порты программного обеспечения:
   - [ ] xorg
   - [ ] IceWM
   - [ ] Fluxbox
   - [ ] Openbox
   - [ ] WindowMaker
   - [ ] i3-gaps
   - [ ] neovim
   - [ ] Qt5
   - [ ] Qt6
   - [ ] GTK3
   - [ ] GTK4
- [ ] Написать скрипты для автоматизации создания порта;
- [ ] Написать документацию системы портов
   - [ ] Описать структуру СП, строение порта и структуру всех файлов, входящих
         в порт;
   - [ ] Описать существующие на данный момент категории ПО;
   - [ ] Описать всё программное обеспечение, входящее в порт;

## Структура СП

Система портов располагается в директории `/usr/ports`. Каждая директория
оттуда является категорией. Например, `base` - это базовое ПО, которое входит в
поставку дистрибутива Calmira GNU/Linux-libre. `xorg` - X сервер и необходимое
для его работы ПО.

Каждая поддиректория в директориях из `/usr/ports` - это либо название пакета,
порт которого существует в СП, либо название подкатегории. Подкатегорий (и
соответственно - поддиректорий) неограниченное количество, но советуется не
более трёх. Кроме того, в каждом каталоге, который является либо категорией,
либо подкатегорией, существует файл `description` с описанием
категории/подкатегории.

***Список №1: варианты расположения портов в файловой системе.***

- `/usr/ports/категория/пакет`
- `/usr/ports/категория/подкатегория/пакет`
- `/usr/ports/категория/подкатегория1/подкатегория2/пакет`
- `/usr/ports/категория/подкатегория1/подкатегория2/подкатегория3/пакет`

В списке выше представлено 4 варианта расположения портов. Названия портов
состоят из названия категории, подкатегории (при наличии) и названия пакета.
Путь `/usr/ports` не указывается:

***Список №2: варианты названий портов для всех указанных в списке
№1 расположений.***

- `категория/пакет`
- `категория/подкатегория/пакет`
- `категория/подкатегория1/подкатегория2/пакет`
- `категория/подкатегория1/подкатегория2/подкатегория3/пакет`

Выше представлены варианты названий порта для всех указанных четырёх случаев
его нахождения в файловой системе. В документации к Calmira GNU/Linux и прочей
литературе используются именно такие имена. При использовании менеджера системы
портов `cport` также используются именно эти названия. Этот менеджер системы
портов выполняет конкатенацию строки с названием порта (которую указывает
пользователь) и путём до системы портов (`/usr/ports/`), а уже после этого
выполняет необходимые операции с портом.

## Файлы в директории порта

В каждой директории определённого порта (см. список №1) содержится определённый
набор файлов. Каждый файл относится к одной из двух групп:

1. *обязательные файлы* (нахождение которых в директории порта гарантируется, в
противном случае считается, что порт повреждён и операции с ним (установка,
удаление, просмотр информации, обновление) невозможны),
2. *опциональные файлы* (дополнительные патчи и файлы конфигурации по
усмотрению разработчика).

Далее приведён список файлов, отсортированный по категориям.

### 1. Обязательные файлы

- `install` - BASH скрипт с инструкциями по сборке и установке порта.
- `files.list` - простой текстовый файл со списком **всех** файлов,
  устанавливаемых в систему. Каждый новый файл указывается с новой строки.
  Количество строк и их длина ограничена возможностями ПК, наличие пустых строк
  недопустимо.
- `port.toml` - конфигурационный файл формата TOML, содержащий информацию о
  пакете и порте.
- `description` - полное описание пакета. Кол-во строк неограничено, размер
  строк не должен превышать 80 символов.
- `index.html` - HTML-файл с описанием процесса сборки. Формат: как в BLFS:
    - Краткое и полное описание;
    - Ссылки для скачивания архива с исходным кодом, MD5-контрольные суммы,
      размер, время сборки;
    - Описание зависимостей, что для чего;
    - Сборочные инструкции (копия из файла `install`);
    - Доп. сведения о командах;
    - Дата последней модификации.

### 2. Необязательные файлы

- `files/` - директория с дополнительными **текстовыми** файлами (например,
  патчами). Наличие других типов файлов (например, архивов) не допускаеися.
- `port-configuration.sh` - BASH скрипт, готовый для подключения в файл
  `install` (командой `.` или `source`), содержащий в себе всевозможные
  переменные и прочие сведения. Предназначен для конфигурации процесса сборки и
  установки порта. Как правило, содержит в себе дополнительные сведения.

## Содержимое файлов порта

### 1. `install`

```bash
#!/bin/bash -e

# Две переменные ниже содержат в себе имя и версию пакета, либо те сведения,
# которые входят в имя директории с исходным кодом пакета, которая была
# распакована из архива, скачанного с помощью 'cport'
NAME="имя пакета"
VERSION="версия пакета"

# Архив с исходным кодом пакета скачивается и распаковывается посредством
# 'cport' в директорию '/usr/src'
cd /usr/src/$NAME-$VERSION

# Далее выполняются типичные операции сборки и установки пакета из исходников:
# - конфигурирование;
# - сборка;
# - установка
# Возможно также выполнение прочих действий, предназначенных для корректной
# сборки и установки порта. Ниже представлен примерный алгоритм действий.

./configure --prefix=/usr --disable-static
make
make install
```

### 2. `files.list`

```
/usr/bin/some
/usr/share/some
/usr/doc/some
```

В `files.list` перечисляются как файлы, так и директории.

### 2. `port.toml`

```toml
[package]
name = "имя пакета"
version = "версия пакета"
description = "краткое описание пакета"
maintainer = "сборщик порта этого пакета"
releases = [ "список", "релизов", "Calmira", "для которых предназначен порт"]
priority = "system/user"
usage = 666.999
upgrade_mode = "soft/hard"
build_time = 0.0

[deps]
required = "необходимые зависимости"
build_required = "необходимые для сборки зависимости"
recommend = "рекомендуемые зависимости"
optional = "опциональные зависимости"
conflict = "конфликтующие зависимости"

[port]
url = "ссылка для скачивания архива с исходным кодом"
file = "файл, который будет скачан по ссылке из параметра 'port.url'"
md5 = "md5 контрольная сумма"
```

**Примечания:**

1. В пункте `name` указывается не имя *порта*, а имя *пакета*.
2. `description` - это краткое описание пакета, состоящее из одной строки не
   более 80 символов.
3. `usage` - место, которое будет занято после сборки и установки порта.
   Указывается в Мб.
4. `priority` - приоритет порта (`system` - системный, `user` -
   пользовательский). При использовании системного приоритета становится
   невозможным удаление порта из системы средствами `cport`, а при наличии
   порта в базе данных установленного ПО, но отсутствии всех или части его
   файлов в системе, выдаётся предупреждение об этом и предложение
   переустановить порт.
4. `upgrade_mode` - режим обновления (`safe` - мягкий, `hard` - твёрдый). При
   использовании `hard` режима сначала выполняется полное удаление порта как из
   системы, так и из базы данных установленного ПО `cport`, а затем установка
   "вчистую" этого порта обратно в систему и фиксация информации о нём в БД.
   При использовании `soft` режима операция удаления не производится.
   Выполняется установка новой версии "поверх" существующей, а также
   *обновление* записи в базе данных. В том случае, если у порта системный
   приоритет (`priority='system'`), то параметр `upgrade_mode` игнорируется,
   для обновления используется `soft` режим.
5. В параметре `build_time` указывается значение типа `float`, указанное в
   единицах SBU (Standard Build Unit).
5. В секциях `package` и `port` находятся *обязательные* параметры, которые
   должны присутствовать при любях обстоятельствах.
5. В секции `deps` находятся *необязательные* параметры, которые в случае
   необходимости могут быть опущены.

## Принятые категории и подкатегории

- `base` - базовое программное обеспечение, входящее в минимальную поставку
  Calmira GNU/Linux(-libre), либо рекомендуемое (но не обязательно входящее)
  для минимальной поставки отдельных редакций.
   - `editors` - текстовые редакторы.
   - `efi` - порты, необходимые для возможности загрузки системы на EFI
     конфигурации.
- `xorg` - X сервер и необходимое для его работы ПО.
   - `wm` - оконные менеджеры.
   - `x11-libs` - библиотеки.
   - `x11-minimal` - X сервер и необходимое для его работы ПО.
