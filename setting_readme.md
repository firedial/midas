
# 環境設定の方法


## 環境変数について

各アプリケーションに対して下記の設定を行う。

midas-eru: .env.sample ファイルを .env にコピー
midas-misuzu: config/env.go.sample ファイルを env.go にコピー
midas-nagisa: src/Config/Env.elm.sample ファイルを Env.elm にコピー
midas-rikka: .env.sample ファイルを .env にコピー
midas-yui: .db_environment.env.sample ファイルを .db_environment.env にコピー

それぞれの設定値を必要に応じて設定する。

## web サーバーのドメインとポートについて

サーバーのドメイン名とポートの設定を下記ファイルで行う。
midas-konata/conf.d/reverse_proxy.conf
midas-konata/conf.d/reverse_proxy_prod.conf


