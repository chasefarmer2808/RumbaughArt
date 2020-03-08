# Rumbaugh Art

## Environment setup
1. Install the latest version of Node and Angular.
2. Install the Angular CLI with `npm install -g @angular/cli`.  This will be used for frontend development and building.
2. Install Gulp with `npm install -g gulp`.  This will be used to execute helper scripts for deployment.
3. Run `npm install` in the Angular app directory.
4. Install Python 3.7.
5. Install pip and pipenv.
6. Run `pipenv install` in the server directory.
7. Create a .env file using the .env.example as a template.  Use `cp .env.example .env`.
8. Fill in the environment variables within .env appropriatly.

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

## Build and deploy
1. Build the Angular app with `ng build --prod --build-optimizer=false`.  This should create a `dist` folder in the root of the Angular app directory.
2. Run `gulp copyBuild` to copy the static app files to the server's directory.
3. Build the Flask web server with `docker-compose build api`.
4. Run the entire web app with `docker-compose up`.