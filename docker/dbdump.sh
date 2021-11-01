#!/usr/bin/env bash

# Set env vars from dotenv file
set -o allexport
source .env
set +o allexport

mysqldump \
  --host 127.0.0.1 \
  --port $MYSQL_FORWARD_PORT \
  --user $MYSQL_USER \
  --password $MYSQL_PASSWORD \
  -- $MYSQL_DATABASE \
  | gzip > wordpress.sql.gz

