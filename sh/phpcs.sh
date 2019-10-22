#!/usr/bin/env bash
docker container exec -i -u0 $(grep APPLICATION $(dirname $0)/../.env | cut -d '=' -f2)_php phpcs "$@"
