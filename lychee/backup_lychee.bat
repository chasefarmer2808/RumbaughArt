docker exec rumbaughart_lychee_1 tar -cf backup.tar pictures config/log config/lychee config/nginx config/php config/www
docker cp rumbaughart_lychee_1:/backup.tar ./backups