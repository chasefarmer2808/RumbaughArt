#!/bin/bash
cd "$(dirname "$0")"

set -o allexport; source .env; set +o allexport

docker exec rumbaughart_mysql_1 mysqldump -u $MYSQL_ROOT_USER --password=$MYSQL_ROOT_PASSWORD lychee > db/backups/backup.sql

docker exec rumbaughart_lychee_1 tar -cf backup.tar pictures config/log config/lychee config/nginx config/php config/www
docker cp rumbaughart_lychee_1:/backup.tar lychee/backups