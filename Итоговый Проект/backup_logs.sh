#!/bin/bash

LOG_DIR="/var/log/httpd"
TARGET_FILE="access_log"
DATE=$(date +%Y%m%d)
BACKUP_DIR=$LOG_DIR
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"

# Создаем директорию для бекапа
mkdir -p "$BACKUP_DIR"

# Архивируем лог файлы
tar -czf "$BACKUP_FILE" "$LOG_DIR/$TARGET_FILE"

# Очищаем файл который архивируем
> "$LOG_DIR/$TARGET_FILE"

# Удаляем старые архивы
find "$BACKUP_DIR" -maxdepth 1 -type f -name "*.tar.gz" -mtime +3 -delete
