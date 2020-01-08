FROM linuxserver/lychee

ENV BACKUP_VERS 0.3

COPY ./backups/backup_${BACKUP_VERS}.tar /
RUN tar -xvf /backup_${BACKUP_VERS}.tar