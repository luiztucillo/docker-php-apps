#!/usr/bin/env bash
docker container exec -i -u0 m1_php phpcs "$@"
