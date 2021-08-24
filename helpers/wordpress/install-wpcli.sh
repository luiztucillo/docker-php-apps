#!/bin/bash

DIR=$(dirname $0)
USERNAME=$(grep USERNAME ${DIR}/../../.env | cut -d '=' -f2)

docker container exec -u0 wordpress_php curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
    && docker container exec -u0 wordpress_php chown ${USERNAME}:${USERNAME} /usr/local/bin/wp \
    && docker container exec -u0 wordpress_php chmod +x /usr/local/bin/wp
