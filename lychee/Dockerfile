FROM linuxserver/lychee

ENV BACKUP_VERS 1.0

COPY ./backups/backup_${BACKUP_VERS}.tar /
COPY ./restore_backup.sh /config/custom-cont-init.d/