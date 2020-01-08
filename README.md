# Rumbaugh Art

## Backup Instructions
### First, backup the database:
1. Exec into the db docker container by running `docker exec -it container_name /bin/bash`.
2. Dump the state of the datebase with `mysqldump -u username -p lychee > backup.sql`.
3. Back on the host, run the `backup_db.bat` file.
4. You should see a `backup.sql` file in the backups folder.  Append the desired version number to the filename.
5. Update the `BACKUP_VERS` environment variable in the Dockerfile.

### Next, backup Lychee:
1. On the host, run the `backup_lychee.bat` file.
2. You should see a `backup.tar` file in the backups folder.  Append the desired version number to the filename.
3. Update the `BACKUP_VERS` environment variable in the Dockerfile.

### Finally, update the version number in the .env file and rebuild the lychee and mysql docker images to test the backup.
