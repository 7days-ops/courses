#!/bin/bash

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
  echo "Укажите путь к файлу резервной копии, например:"
  echo "./restore.sh backup/backup_20251104_120000.sql"
  exit 1
fi

echo "Восстановление базы данных из ${BACKUP_FILE}..."
cat "$BACKUP_FILE" | docker exec -i postgres_db psql -U user -d mydb

echo "Восстановление завершено."
