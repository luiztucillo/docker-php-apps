#!/bin/bash

DIR=$(dirname $0)
APPLICATION=$(grep APPLICATION ${DIR}/../../.env | cut -d '=' -f2)
USERNAME=$(grep USERNAME ${DIR}/../../.env | cut -d '=' -f2)

docker container exec -u0 ${APPLICATION}_php rm -rf /home/${USERNAME}/wpcs \
  && docker container exec -u0 ${APPLICATION}_php git clone -b master https://github.com/WordPress/WordPress-Coding-Standards.git /home/${USERNAME}/wpcs \
  && docker container exec -u0 ${APPLICATION}_php chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/wpcs \
  && docker container exec -u0 ${APPLICATION}_php phpcs --config-set installed_paths /home/${USERNAME}/wpcs