CREATE USER IF NOT EXISTS 'test_user'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

DROP TABLE IF EXISTS lychee_photos;
DROP TABLE IF EXISTS lychee_albums;

CREATE TABLE lychee_photos
(
    id INTEGER AUTO_INCREMENT,
    title TEXT,
    album INTEGER,
    url TEXT,
    thumbUrl TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE lychee_albums
(
    id INTEGER AUTO_INCREMENT,
    title TEXT,
    public BINARY,
    PRIMARY KEY (id)
);

ALTER TABLE lychee_photos ADD CONSTRAINT fk_album FOREIGN KEY (album) REFERENCES lychee_albums(id);

INSERT INTO lychee_albums (title, public) VALUES ('Paintings', 1);

INSERT INTO lychee_photos (title, album, url, thumbUrl) VALUES ('Flowers', 1, '1', '1');

GRANT ALL ON test_db.* TO 'test_user'@'%';