#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
DIR=$(dirname $0)
APPLICATION=$(grep APPLICATION ${DIR}/../../.env | cut -d '=' -f2)

docker container exec -it ${APPLICATION}_php composer global require -vvv hirak/prestissimo \
  && docker container exec -it --workdir /var/www/html ${APPLICATION}_php \
       composer create-project -vvv --repository-url=https://repo.magento.com/ magento/project-community-edition /var/www/html \
  || docker container exec -it --workdir /var/www/html ${APPLICATION}_php composer update -vvv
