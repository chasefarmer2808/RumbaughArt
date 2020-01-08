FROM mysql

ENV BACKUP_VERS 0.3

COPY ./init_db.sh /docker-entrypoint-initdb.d/
COPY ./init_test_db.sql /docker-entrypoint-initdb.d/
COPY ./init_lychee_db.sql /docker-entrypoint-initdb.d/
COPY ./backups/backup_${BACKUP_VERS}.sql .