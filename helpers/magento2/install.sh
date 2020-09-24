#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
DIR=$(dirname $0)
APPLICATION=$(grep APPLICATION ${DIR}/../../.env | cut -d '=' -f2)
DOMAIN=$(grep DOMAIN ${DIR}/../../.env | cut -d '=' -f2)
DB_PASSWORD=$(grep DB_PASSWORD ${DIR}/../../.env | cut -d '=' -f2)

docker container exec ${APPLICATION}_mysql mysql -hlocalhost -uroot -p${DB_PASSWORD} -e "create database if not exists dev_magento2";

docker container exec -it ${APPLICATION}_php composer update -vvv && \
  docker container exec -it --workdir /var/www/html ${APPLICATION}_php php /var/www/html/bin/magento setup:install --base-url=http://${DOMAIN}/ \
    --db-host=mysql \
    --db-name=dev_magento2 \
    --db-user=root \
    --db-password=${DB_PASSWORD} \
    --admin-firstname=Admin \
    --admin-lastname=ADmin \
    --admin-email=admin@admin.com \
    --admin-user=admin \
    --admin-password=${DB_PASSWORD} \
    --language=pt_BR \
    --currency=BRL \
    --timezone=America/Sao_Paulo \
    --use-rewrites=1 \
    --elasticsearch-port=9200 \
    --elasticsearch-host=elastic \
    --search-engine=elasticsearch7

docker container exec -it --workdir /var/www/html ${APPLICATION}_php php /var/www/html/bin/magento setup:config:set \
    --session-save=redis \
    --session-save-redis-host=redis \
    --session-save-redis-port=6379 \
    --session-save-redis-log-level=4 \
    --session-save-redis-db=2

docker container exec -it --workdir /var/www/html ${APPLICATION}_php php /var/www/html/bin/magento setup:config:set \
    --page-cache=redis \
    --page-cache-redis-port=6379 \
    --page-cache-redis-server=redis \
    --page-cache-redis-db=1
