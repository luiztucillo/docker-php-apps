#!/bin/bash

DIR=$(dirname $0)
APPLICATION=$(grep APPLICATION ${DIR}/../../.env | cut -d '=' -f2)
USERNAME=$(grep USERNAME ${DIR}/../../.env | cut -d '=' -f2)

docker container exec -u0 ${APPLICATION}_php curl https://files.magerun.net/n98-magerun.phar -o /usr/local/bin/n98 \
    && docker container exec -u0 ${APPLICATION}_php chown ${USERNAME}:${USERNAME} /usr/local/bin/n98 \
    && docker container exec -u0 ${APPLICATION}_php chmod +x /usr/local/bin/n98
