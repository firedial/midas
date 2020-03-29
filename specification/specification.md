# 家計簿管理システムの仕様書

## はじめに

家計簿をつけるためのシステムを構築するための仕様書を書く。

## 管理したいこと

* 収支の管理
* どの場所(財布、銀行など)にいくらあるかの管理
* 予算管理

## 文字列の制限

登録できる文字列は UTF-8 の可読文字の中で下記の5種類の半角記号を除く文字とする。

* シングルクォーテーション (0x27)
* ダブルクォーテーション (0x22)
* コロン (0x3A)
* ドット (0x2E)
* 半角スペース (0x20)

属性に関する名前は下記の制約をつける。

属性名: [a-z][a-z_]*

属性グループ名: [A-Z][a-z_]*

属性カテゴリー名: \_[a-z][a-z_]*

※ UTF-8 の可読文字は 0x0000 から 0x001F, 0x007F, 0x0080 から 0x009F の文字以外を指すことにする

## 移動処理

purpose と place 属性は移動ができる。
移動は balance を 2 レコードを使って表現する。
その際、下記の制約をつける。

* 2 レコードの主キーが連番になっていること
* 移動元の主キーの方が若いこと
* 移動元の金額は負の値で、移動先の金額との合計が 0 になっていること
* 関係ない属性の値は 1 であること(place の移動なら kind_id = purpose_id = 1)
* 日付は移動した日付を指定する

## 初期レコード

移動処理用の attribute レコード
* attribute_id: 1
* name: move
* description: 移動
* group_attribute_id: 1

移動処理用の attribute_group レコード
* attribute_group_id: 1
* name: Move
* description: 移動

移動処理用の attribute_category レコード
* attribute_category_id: 1
* name: _move
* description: 移動

移動処理用の attribute_category_relation レコード
* attribute_category_id: 1
* attribute_id: 1

## バックアップ

毎日 0:50 に同じ LAN にある NAS に DB のバックアップをとる。

NAS をマウントするコマンド。

```
sudo mount -t cifs //192.168.1.12/midas /mnt/nas -o username=rasp,password=password,iocharset=utf8,rw,uid=1000,gid=1000
```

マウントした NAS にバックアップをとるコマンド。

```
mysqldump --single-transaction -u midas_backup -ppassword midas > /mnt/nas/backup$(date +\%Y\%m\%d\%H\%M\%S).dump
```

バックアップのコマンドを動かす crontab の設定。

```
50 00 * * * /home/pi/midas/backup.sh 
```

## 集計

集計用に毎月一日 0:55 に tsv を出力する。

集計用のデータを取得する SQL.

```
SELECT * FROM balance
LEFT JOIN kind ON kind.id = balance.kind_id
LEFT JOIN purpose ON purpose.id = balance.purpose_id
LEFT JOIN place ON place.id = balance.place_id
```

集計用のコマンド。

```
mysql -u midas_backup -ppassword midas < get_tsv.sql > /mnt/nas/tsv$(date +\%Y\%m\%d\%H\%M\%S).dump
```

集計用のコマンドを動かす crontab の設定。

```
55 00 1 * * /home/pi/midas/tsv.sh 
```
