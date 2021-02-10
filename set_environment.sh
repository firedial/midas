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
sed -i '' -e "s|const DB_USER.*|const DB_USER = \"$DB_CR_USER\"|" ./midas-misuzu/config/env.go
sed -i '' -e "s|const DB_PASSWORD.*|const DB_PASSWORD = \"$DB_CR_PASS\"|" ./midas-misuzu/config/env.go
sed -i '' -e "s|const IS_PRODUCTION.*|const IS_PRODUCTION = $IS_PRODUCTION|" ./midas-misuzu/config/env.go

