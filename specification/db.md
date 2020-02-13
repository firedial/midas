
# DB のテーブルについて

最終的に構成するものである。
現時点では下記と違う箇所がある。

## 構成テーブル

|テーブル名|説明|
|---|---|
|balance|収支を管理するテーブル|
|kind|種別のマスタテーブル|
|purpose|目的のマスタテーブル|
|place|場所のマスタテーブル|
|kind_group|種別グループのマスタテーブル|
|purpose_group|目的グループのマスタテーブル|
|place_group|場所グループのマスタテーブル|
|kind_category_relation|種別カテゴリーの関係テーブル|
|purpose_category_relation|目的カテゴリーの関係テーブル|
|place_category_relation|場所カテゴリーの関係テーブル|
|kind_category|種別カテゴリーのマスタテーブル|
|purpose_category|目的カテゴリーのマスタテーブル|
|place_category|場所カテゴリーのマスタテーブル|

※ kind, purpose, place をまとめて attribute (属性) という (x_group, x_category_relation, x_category も同様)

## 各テーブルの構成

### balance

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|balance_id|INT|PRIMARY KEY|あり||主キー|
|amount|INT|NOT NULL|あり||金額|
|item|VARCHAR(50)|NOT NULL|なし||項目を記載する|
|kind_id|INT|NOT NULL|あり|kind.kind_id|種別|
|purpose_id|INT|NOT NULL|あり|purpose.purpose_id|目的|
|place_id|INT|NOT NULL|あり|place.place_id|場所|
|date|DATE|NOT NULL|あり||収支が発生した日付|

### attribute

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_id|INT|PRIMARY KEY|あり||主キー|
|name|VARCHAR(20)|NOT NULL, UNIQUE|あり||識別するための名前|
|description|VARCHAR(20)|NOT NULL|なし||概要|
|attribute_group_id|INT|NOT NULL|あり|attribute_group.attribute_group_id|属性グループ名|

※ attribute の部分は kind, purpose, place のどれかに読み替えること

### attribute_group

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_group_id|INT|PRIMARY KEY|あり||主キー|
|name|VARCHAR(20)|NOT NULL, UNIQUE|あり||識別するための名前|
|description|VARCHAR(20)|NOT NULL|なし||概要|

※ attribute の部分は kind, purpose, place のどれかに読み替えること

### attribute_category_relation

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_category_id|INT|MUL KEY|あり(注)|attribute_category.attribute_category_id|複合主キー|
|attribute_id|INT|MUL KEY|あり(注)|attribute.attribute_id|複合主キー|

(注) 2カラムのインデックスで順番を入れかえたものを2つ作成する

※ attribute の部分は kind, purpose, place のどれかに読み替えること

### attribute_category

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_category_id|INT|PRIMARY KEY|あり||主キー|
|name|VARCHAR(20)|NOT NULL, UNIQUE|あり||識別するための名前|
|description|VARCHAR(20)|NOT NULL|なし||概要|

※ attribute の部分は kind, purpose, place のどれかに読み替えること

## DB 全体について

* ENGINE: InnoDB
* 文字コード: utf8mb4
* 照合順序: utf8mb4_bin

## ER 図

![erd](https://user-images.githubusercontent.com/42674772/74418695-1d2b8200-4e8c-11ea-8435-41fff04f09b4.png)
