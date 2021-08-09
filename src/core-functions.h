#ifndef CORE_FUNCTIONS_H
#define CORE_FUNCTIONS_H
#include <iostream>
#include <fstream>
#include <cstdio>
#include <string>
#include <curl/curl.h>
#include <sys/stat.h>
#include <archive.h>
#include <archive_entry.h>
#include "file-functions.h"
using namespace std;

/* DEBUG MESSAGE */
void dbg_msg(string message) {
	cout << "\e[1mDEBUG:\e[0m " << message << endl;
}

/* Проверка на существование файла */
bool fileExists(const std::string& file) {
	dbg_msg("Проверка на существование файла...");
    struct stat buf;
    return (stat(file.c_str(), &buf) == 0);
}

/* Функция для удаления файлов/директорий */
int port_remove(const char* file) {
	dbg_msg("Удаление файла...");
	if(remove(file) != 0) {
		log_msg("port_remove", "Ошибка удаления файла!", "Error", "/var/log/port.log");
		cout << "Ошибка удаления файла!\n";
		exit(1);
	} else {
		cout << "Файл " << file << " удалён упешно.\n";
	}
	return 0;
}

/* Функция для переименования файлов */
int port_rename(const char* oldfile, const char * newfile) {
	dbg_msg("Переименование файла...");
	if(rename(oldfile, newfile) != 0) {
		log_msg("port_rename", "Ошибка переименования файла!", "Error", "/var/log/port.log");
		cout << "Ошибка переименования файла!\n";
		exit(1);
	} else {
		cout << "Файл " << oldfile << " переименован успешно в " << newfile << endl;
	}
	return 0;
}

#endif
