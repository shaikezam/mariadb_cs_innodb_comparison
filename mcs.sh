#!/bin/bash
gunzip entries.csv
docker compose up -d
docker exec -it mcs provision mcs
docker exec -it mcs bash -c 'mariadb < /tmp/script.sql'