# 家計簿管理システム Midas 

家計簿を管理するためのシステム

## 実行

### ローカルでの実行

```
$ git clone --recursive https://github.com/firedial/midas.git
$ cd midas
# 必要なら Environment を書き換える
$ sh ./set_environment.sh
$ docker-compose up -d
```

### ラズパイでの実行

```
$ git clone --recursive https://github.com/firedial/midas.git
$ cd midas
# midas-nagisa を elm でコンパイル
$ docker-compose -f docker-compose.yml -f docker-compose_rasp.yml up -d
```

