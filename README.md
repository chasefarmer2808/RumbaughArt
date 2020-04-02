# Rumbaugh Art

This is a portfolio website for artist Suzanne Rumbaugh.  Check out the live site here: [srumbaugh.com](srumbaugh.com)

## Environment setup
1. Install the latest version of Node and Angular.
2. Install the Angular CLI with `npm install -g @angular/cli`.  This will be used for frontend development and building.
3. Run `npm install` in the Angular app directory.
4. Install Python 3.7.
5. Install pip and pipenv.
6. Run `pipenv install` in the server directory.
7. Create a .env file using the .env.example as a template.  Use `cp .env.example .env`.
8. Fill in the environment variables within .env appropriatly.
9. Make copies of the backup template files and remove the template suffixes.

## Backup Instructions
When the app is running, you can backup the state of the lychee and mysql database by running the backup_all.sh command.  This will overwride the backup.sql and backup.tar files.  **Make sure to run this backup before running `docker-compose down` on the production server.

## Build and deploy
1. Build the Angular app with `docker build -t chasefarmer94/rumbuagh-art-app:prod --build-arg configuration=prod .`
2. Push the web image with `docker push chasefarmer94/rumbaugh-art-app:prod`.
3. Build the Flask web server, mysql database, lychee app, and pull latest web with `docker-compose build`.
4. Run the entire web app with `docker-compose up`.