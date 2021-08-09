#include <iostream>
#include <fstream>
#include <cstdio>
#include <string>
#include <curl/curl.h>
#include <sys/stat.h>
#include <archive.h>
#include <archive_entry.h>
#include "str_switch.h"
using namespace std;

/* DEBUG MESSAGE */
void dbg_msg(string message) {
	cout << "DEBUG: " << message << endl;
}

/* Проверка на существование файла */
bool fileExists(const std::string& file) {
    struct stat buf;
    return (stat(file.c_str(), &buf) == 0);
}

/* Функция для удаления файлов/директорий */
int port_remove(const char* file) {
	if(remove(file) != 0) {
		cout << "Ошибка удаления файла!\n";
		exit(1);
	} else {
		cout << "Файл " << file << " удалён упешно.\n";
	}
	return 0;
}

/* Функция для переименования файлов */
int port_rename(const char* oldfile, const char * newfile) {
	if(rename(oldfile, newfile) != 0) {
		cout << "Ошибка переименования файла!\n";
		exit(1);
	} else {
		cout << "Файл " << oldfile << " переименован успешно в " << newfile << endl;
	}
	return 0;
}

/*             */

size_t write_data(void *ptr, size_t size, size_t nmemb, FILE *stream) {
	size_t written = fwrite(ptr, size, nmemb, stream);
	return written;
}

/* Функция для скачивания файлов по http */
int port_download(char* address) {
    CURL *curl;
    FILE *fp;
    CURLcode res;
    char *url = address;
    char outfilename[FILENAME_MAX] = "/var/cache/cpkg/ports.txz";
    curl = curl_easy_init();
    
    if(fileExists("/var/cache/cpkg/ports.txz")) {
    	port_remove("/var/cache/cpkg/ports.txz");
    }
    
    if (!curl) {
    	cout << "Error: проблемы с curl\nРешите их и продолжите работу.\n";
    	exit(1);
    } else {
        fp = fopen(outfilename,"wb");
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
        res = curl_easy_perform(curl);
        /* always cleanup */
        curl_easy_cleanup(curl);
        fclose(fp);
    }
    
    if(!fileExists("/var/cache/cpkg/ports.txz")) {
    	cout << "Файл 'ports.txz' не был скачан!\n";
    	exit(1);
    } else {
    	cout << "Файл 'ports.txz' скачан.\n";
    }
    return 0;
}

/* Скачивание порта */
int get_ports(char* tree) {
	if(fileExists("/var/cache/cpkg/ports.txz")) {
		cout << "Найден архив с портами. Удаление...\n";
		port_remove("/var/cache/cpkg/ports.txz");
	}
	
	if(tree = "main") {
		port_download("https://gitlab.com/Linuxoid85/calmira_ports/-/raw/main/ports-lx4_1.1.txz");
	} else if(tree = "testing") {
		port_download("https://gitlab.com/Linuxoid85/calmira_ports/-/raw/testing/ports-lx4_1.1.txz");
	} else {
		cout << "ОШИБКА: ветки " << tree << " не существует!\n";
		exit (1);
	}
	return 0;
}

/* Распаковка */
static int copy_data(struct archive *ar, struct archive *aw)
{
  int r;
  const void *buff;
  size_t size;
  la_int64_t offset;

  for (;;) {
    r = archive_read_data_block(ar, &buff, &size, &offset);
    if (r == ARCHIVE_EOF)
      return (ARCHIVE_OK);
    if (r < ARCHIVE_OK)
      return (r);
    r = archive_write_data_block(aw, buff, size, offset);
    if (r < ARCHIVE_OK) {
      fprintf(stderr, "%s\n", archive_error_string(aw));
      return (r);
    }
  }
}

static void extract_ports(const char *filename)
{
  struct archive *a;
  struct archive *ext;
  struct archive_entry *entry;
  int flags;
  int r;

  /* Select which attributes we want to restore. */
  flags = ARCHIVE_EXTRACT_TIME;
  flags |= ARCHIVE_EXTRACT_PERM;
  flags |= ARCHIVE_EXTRACT_ACL;
  flags |= ARCHIVE_EXTRACT_FFLAGS;

  a = archive_read_new();
  archive_read_support_format_all(a);
  archive_read_support_compression_all(a);
  ext = archive_write_disk_new();
  archive_write_disk_set_options(ext, flags);
  archive_write_disk_set_standard_lookup(ext);
  if ((r = archive_read_open_filename(a, filename, 10240)))
    exit(1);
  for (;;) {
    r = archive_read_next_header(a, &entry);
    if (r == ARCHIVE_EOF)
      break;
    if (r < ARCHIVE_OK)
      fprintf(stderr, "%s\n", archive_error_string(a));
    if (r < ARCHIVE_WARN)
      exit(1);
    r = archive_write_header(ext, entry);
    if (r < ARCHIVE_OK)
      fprintf(stderr, "%s\n", archive_error_string(ext));
    else if (archive_entry_size(entry) > 0) {
      r = copy_data(a, ext);
      if (r < ARCHIVE_OK)
        fprintf(stderr, "%s\n", archive_error_string(ext));
      if (r < ARCHIVE_WARN)
        exit(1);
    }
    r = archive_write_finish_entry(ext);
    if (r < ARCHIVE_OK)
      fprintf(stderr, "%s\n", archive_error_string(ext));
    if (r < ARCHIVE_WARN)
      exit(1);
  }
  archive_read_close(a);
  archive_read_free(a);
  archive_write_close(ext);
  archive_write_free(ext);
  exit(0);
}

/* Работа с установкой портов */
void install_port(char* tree) {
	get_ports(tree);                        /* Получение порта */
	extract_ports("/var/cache/cpkg/ports.txz");   /* Распаковка порта */
	
	/* Проверка на наличие предыдущей версии СП */
	if(fileExists("/usr/ports")) {
		cout << "Предыдущая версия Системы портов установлена. Архивирование...\n";
		port_rename("/usr/ports", "/usr/ports.old");
	}
	
	/* Перенос новой версии СП */
	if(fileExists("/var/cache/cpkg/ports")) {
		cout << "Обновление системы портов...\n";
		port_rename("/var/cache/cpkg/ports", "/usr/ports");
	} else {
		cout << "ОШИБКА: Система портов не была распакована, либо была удалена во время распаковки. Аварийное завершение работы.\n";
		exit(1);
	}	
}

int main(int argc, char* argv[]) {
	if(argc != 2) {
		cout << "Введите имя ветки!\n";
		exit(1);
	}
	install_port(argv[1]);
	return 0;
}
