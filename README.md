# 家計簿管理システム Midas 

家計簿を管理するためのシステム

## 実行

### ローカルでの実行

```
$ cd midas
$ docker-compose up -d
```

### ラズパイでの実行

```
$ cd midas
# midas-nagisa を elm でコンパイル
$ docker-compose -f docker-compose.yml -f docker-compose_rasp.yml up -d
```

## 構成

### API サーバー

GO で作成。
https://github.com/firedial/midas-go

### フロント

Elm で作成。
https://github.com/firedial/midas-elm

