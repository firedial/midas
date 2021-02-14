#!/bin/sh

# 環境変数の読み込み
. ./Environment

# eru
sed -i '' -e "s|API_URL:.*|API_URL: '\"$API_URL\"'|" ./midas-eru/config/dev.env.js

# nagisa
cp ./midas-nagisa/src/Config/Env.elm.sample ./midas-nagisa/src/Config/Env.elm
sed -i '' -e "s|getApiUrl = .*|getApiUrl = \"$API_URL\"|" ./midas-nagisa/src/Config/Env.elm

# misuzu
cp ./midas-misuzu/config/env.go.sample ./midas-misuzu/config/env.go
sed -i '' -e "s|const DB_HOST.*|const DB_HOST = \"$DB_HOST\"|" ./midas-misuzu/config/env.go
sed -i '' -e "s|const DB_DATABASE.*|const DB_DATABASE = \"$DB_DATABASE_NAME\"|" ./midas-misuzu/config/env.go
sed -i '' -e "s|const DB_USER.*|const DB_USER = \"$DB_MIDAS_API_USER\"|" ./midas-misuzu/config/env.go
sed -i '' -e "s|const DB_PASSWORD.*|const DB_PASSWORD = \"$DB_MIDAS_API_PASS\"|" ./midas-misuzu/config/env.go
sed -i '' -e "s|const IS_PRODUCTION.*|const IS_PRODUCTION = $IS_PRODUCTION|" ./midas-misuzu/config/env.go

# yui
cp ./midas-yui/.db_environment.env.sample ./midas-yui/.db_environment.env
sed -i '' -e "s|MYSQL_ROOT_PASSWORD=.*|MYSQL_ROOT_PASSWORD=$DB_ROOT_PASS|" ./midas-yui/.db_environment.env
sed -i '' -e "s|DB_MIDAS_ROOT_USER=.*|DB_MIDAS_ROOT_USER=$DB_MIDAS_ROOT_USER|" ./midas-yui/.db_environment.env
sed -i '' -e "s|DB_MIDAS_ROOT_PASS=.*|DB_MIDAS_ROOT_PASS=$DB_MIDAS_ROOT_PASS|" ./midas-yui/.db_environment.env

sed -i '' -e "s|DB_MIDAS_API_USER=.*|DB_MIDAS_API_USER=$DB_MIDAS_API_USER|" ./midas-yui/.db_environment.env
sed -i '' -e "s|DB_MIDAS_API_PASS=.*|DB_MIDAS_API_PASS=$DB_MIDAS_API_PASS|" ./midas-yui/.db_environment.env

sed -i '' -e "s|DB_MIDAS_BACKUP_USER=.*|DB_MIDAS_BACKUP_USER=$DB_MIDAS_BACKUP_USER|" ./midas-yui/.db_environment.env
sed -i '' -e "s|DB_MIDAS_BACKUP_PASS=.*|DB_MIDAS_BACKUP_PASS=$DB_MIDAS_BACKUP_PASS|" ./midas-yui/.db_environment.env

sed -i '' -e "s|DB_DATABASE_NAME=.*|DB_DATABASE_NAME=$DB_DATABASE_NAME|" ./midas-yui/.db_environment.env
