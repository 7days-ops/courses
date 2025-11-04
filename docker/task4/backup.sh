#!/bin/bash

BACKUP_DIR="./backup"
FILE_NAME="backup_$(date +'%Y%m%d_%H%M%S').sql"

echo "Создание резервной копии базы данных..."
docker exec -t postgres_db pg_dump -U user mydb > "${BACKUP_DIR}/${FILE_NAME}"

echo "Резервная копия создана: ${BACKUP_DIR}/${FILE_NAME}"
