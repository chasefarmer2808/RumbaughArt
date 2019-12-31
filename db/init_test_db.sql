CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

DROP TABLE IF EXISTS lychee_photos;
CREATE TABLE lychee_photos
(
    id INTEGER AUTO_INCREMENT,
    title TEXT,
    album INTEGER,
    PRIMARY KEY (id)
);

INSERT INTO lychee_photos (title, album) VALUES ('Flowers', 1);