#!/usr/bin/env bash

# Set env vars from dotenv file
set -o allexport
source .env
set +o allexport

dateStr=$(date +"%Y%m%d_%H%M")

mysqldump \
  --host 127.0.0.1 \
  --port $MYSQL_FORWARD_PORT \
  --user $MYSQL_USER \
  --password="$MYSQL_PASSWORD" \
  --no-tablespaces \
  --column-statistics=0 \
  -- $MYSQL_DATABASE \
  | gzip > wordpress_$dateStr.sql.gz

