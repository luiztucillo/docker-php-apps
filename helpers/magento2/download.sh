#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
DIR=$(dirname $0)
APPLICATION=$(grep APPLICATION ${DIR}/../../.env | cut -d '=' -f2)

docker container exec -u0 --workdir /var/www/html ${APPLICATION}_php \
       composer self-update

docker container exec --workdir /var/www/html ${APPLICATION}_php \
       composer create-project -vvv --repository-url=https://repo.magento.com/ magento/project-community-edition /var/www/html/tmp

docker container exec --workdir /var/www/html ${APPLICATION}_php \
       mv tmp/* ./

docker container exec --workdir /var/www/html ${APPLICATION}_php \
       mv tmp/.* ./

docker container exec --workdir /var/www/html ${APPLICATION}_php \
       rm -rf /var/www/html/tmp
