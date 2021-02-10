#!/bin/sh

# 環境変数の読み込み
. ./Environment

# eru
sed -i '' -e "s|API_URL:.*|API_URL: '\"$API_URL\"'|" ./midas-eru/config/dev.env.js

# nagisa
cp ./midas-nagisa/src/Config/Env.elm.sample ./midas-nagisa/src/Config/Env.elm
sed -i '' -e "s|getApiUrl = .*|getApiUrl = \"$API_URL\"|" ./midas-nagisa/src/Config/Env.elm


