# Список портов с пакетами

Список актуален на 12.08.2021.

* **Базовый софт (`base`):**
	* `acl`
	* `attr`
	* `autoconf`
	* `automake`
	* `bash`
	* `bc`
	* `binutils`
	* `bison`
	* `bootscripts`
	* `bzip2`
	* `check`
	* `coreutils`
	* `dejagnu` (не входит в минимальную поставку дистрибутива)
	* `diffutils`
	* `dosfsprogs` (не входит в минимальную поставку дистрибутива)
	* `e2fsprogs`
	* `eudev`
	* `expat`
	* `expect`
	* `file`
	* `findutils`
	* `flex`
	* `freetype`
	* `gawk`
	* `gcc`
	* `gdbm`
	* `gettext`
	* `glibc`
	* `gmp`
	* `gperf`
	* `grep`
	* `groff`
	* `grub-efi` (не входит в минимальную поставку дистрибутива)
	* `grub-mbr`
	* `gzip`
	* `iana-etc`
	* `inetutils`
	* `intltool`
	* `iproute2`
	* `isl` (не входит в минимальную поставку дистрибутива)
	* `kbd`
	* `kmod`
	* `less`
	* `libcap`
	* `libelf`
	* `libffi`
	* `libpipeline`
	* `libtasn1`
	* `libtool`
	* `m4`
	* `make`
	* `make-ca`
	* `man-db`
	* `meson`
	* `mpc`
	* `mpfr`
	* `ncurses`
	* `ninja`
	* `openssl`
	* `p11-kit`
	* `patch`
	* `pciutils`
	* `perl`
	* `pkg-config`
	* `popt`
	* `procps-ng`
	* `psmisc`
	* `python`
	* `readline`
	* `sed`
	* `shadow`
	* `sysklogd`
	* `sysvinit`
	* `tar`
	* `tcl` (не входит в минимальную поставку дистрибутива)
	* `texinfo`
	* `util-linux`
	* `vim`
	* `wget`
	* `xml:parser`
	* `xz`
	* `zlib`
	* `zstd`
* **Консольный софт (`console`):**
	* `dialog`
		* **Текстовые редакторы (`editors`):**
			* `emacs` (не входит в минимальную поставку дистрибутива)
			* `nano` (не входит в минимальную поставку дистрибутива)
	* `gpm`
	* `mc`
	* `pcre`
	* `slang`
	* `tcsh`
	* `tree`
* **Основные билсиотеки (`general_libs`):**
	* `glib`
* **Ядра (`kernel`):**
	* `linux-5.12.13`
	* `linux-5.13.1`
* **Мультимедиа-утилиты (`multimedia`):**
	* `alsa-firmware`
	* `alsa-lib`
	* `alsa-plugins`
	* `alsa-tools`
	* `alsa-utils`
* **Сети (`network`):**
	* **Браузеры (`browsers`):**
		* `lynx`
	* **Подключение к сети (`connecting`):**
		* `DHCP`
		* `dhcpcd`
		* `wpa_supplicant`
		* `WT (Wireless Tools)`
* **Опциональный софт (`optional`):**
	* `cmake`
	* `curl`
	* `fuse`
	* `gnupg`
	* **Доп. библиотеки (`libs`):**
		* `libarchive`
		* `libassuan`
		* `libgcrypt`
		* `libgpg-error`
		* `libgudev`
		* `libksba`
		* `libusb`
		* `libuv`
	* `llvm`
	* `npth`
	* `ntfs-3g`
	* `sudo`
	* `unrar`
	* `unzip`
	* `usbutils`
	* `which`
	* `which-orig`
	* `xgd-user-dirs`
* **Программирование (`programming`):**
	* `git`	
	* **Модули ЯП Python (`python-modules`):**
		* `Mako`
		* `MarkupSafe`
* **Xorg (`xorg`):**
	* **Рабочие окружения (`x11-de`):**
		* **GNOME (`gnome`):**
			* **Библиотеки (`libs`):**
				* `gcr`
				* `gsettings-desktop-schemas`
				* `libsecret`
				* `rest`
				* `totem-pl-parser`
				* `VTE`
				* `yelp-xsl`
				* `GConf`
	* **Дополнительные библиотеки Xorg (`x11-libs`):**
		* `libdrm`
	* **Минимальная поставка Xorg (`x11-minimal`):**
		* `libXau`
		* `libxcb`
		* `libXdmcp`
		* `mesa`
		* `util-macros`
		* `xbitmaps`
		* Xorg Build System (`XBS`)
		* `xcb-proto`
		* `xcb-util`
		* `xcb-util-cursor`
		* `xcb-utils-image`
		* `xcb-util-keysums`
		* `xcb-util-renderutil`
		* `xcb-util-wm`
		* Xorg Libraries (`xlibs`)
		* `xorgproto`
	* **Оконные менеджеры для Xorg (`x11-wm`):**
		* `fluxbox`
		* `icewm`
		* `openbox`
* **Доп. утилиты:**
	* `makeport.sh` (встречается и в категориях портов) - для автоматизации создания порта.
