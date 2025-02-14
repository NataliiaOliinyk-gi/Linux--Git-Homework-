#!/bin/bash

TARGET_FILE=/var/log/httpd/access_log
DATE=$(date +%Y%m%d)
BACKUP_FILE="/var/log/httpd/backup-$date.tar.gz"


# Архивируем лог файлы
tar -czf "$TARGET_FILE" "$BACKUP_FILE"

# Очищаем файл который архивируем
> "$TARGET_FILE"

# Удаляем старые архивы
find "$BACKUP_FILE" -maxdepth 1 -type f -name "*.tar.gz" -mtime +3 -delete
