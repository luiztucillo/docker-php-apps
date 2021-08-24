#!/bin/bash

DB_NAME=wordpress
DB_PASSWORD=1234qwer
LOCALIZATION=pt_BR
WP_VERSION=latest
URL=wordpress.local

docker exec -u0 wordpress_php chown -R $USERNAME: wp-content

echo -e "\nCreating database"
docker exec wordpress_mysql mysql -uroot -p$DB_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"

echo -e "\nDownloading"
docker exec wordpress_php wp core download --locale=$LOCALIZATION --version=$WP_VERSION
