#!/bin/bash

mysql -u root -p${MYSQL_ROOT_PASSWORD} < /docker-entrypoint-initdb.d/init_test_db.sql