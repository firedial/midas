
# DB のテーブルについて

最終的に構成するものである。

## 構成テーブル

|テーブル名|説明|
|---|---|
|m_balance|収支を管理するテーブル|
|m_kind_element|種別のマスタテーブル|
|m_purpose_element|目的のマスタテーブル|
|m_place_element|場所のマスタテーブル|
|m_kind_category|種別カテゴリーのマスタテーブル|
|m_purpose_category|目的カテゴリーのマスタテーブル|
|m_place_category|場所カテゴリーのマスタテーブル|
|m_kind_group_relation|種別グループの関係テーブル|
|m_purpose_group_relation|目的グループの関係テーブル|
|m_place_group_relation|場所グループの関係テーブル|
|m_kind_group|種別グループのマスタテーブル|
|m_purpose_group|目的グループのマスタテーブル|
|m_place_group|場所グループのマスタテーブル|

※ kind, purpose, place をまとめて attribute (属性) という (x_category, x_group_relation, x_group も同様)

## 各テーブルの構成

### m_balance

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|balance_id|INT|PRIMARY KEY|あり||主キー|
|amount|INT|NOT NULL|なし||金額|
|item|VARCHAR(50)|NOT NULL|なし||項目を記載する|
|kind_element_id|INT|NOT NULL|あり|m_kind_element.kind_element_id|種別|
|purpose_element_id|INT|NOT NULL|あり|m_purpose_element.purpose_element_id|目的|
|place_element_id|INT|NOT NULL|あり|m_place_element.place_element_id|場所|
|date|DATE|NOT NULL|あり||収支が発生した日付|

### m_attribute_element

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_element_id|INT|PRIMARY KEY|あり||主キー|
|attribute_name|VARCHAR(20)|NOT NULL, UNIQUE|あり||識別するための名前|
|attribute_description|VARCHAR(20)|NOT NULL|なし||概要|
|attribute_category_id|INT|NOT NULL|あり|m_attribute_category.attribute_category_id|属性グループ名|

※ attribute の部分は kind, purpose, place のどれかに読み替えること

### m_attribute_category

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_category_id|INT|PRIMARY KEY|あり||主キー|
|attribute_category_name|VARCHAR(20)|NOT NULL, UNIQUE|あり||識別するための名前|
|attribute_category_description|VARCHAR(20)|NOT NULL|なし||概要|

※ attribute の部分は kind, purpose, place のどれかに読み替えること

### m_attribute_group_relation

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_group_id|INT|MUL KEY|あり(注)|m_attribute_group.attribute_group_id|複合主キー|
|attribute_element_id|INT|MUL KEY|あり(注)|m_attribute_element.attribute_element_id|複合主キー|

(注) 2カラムのインデックスで順番を入れかえたものを2つ作成する

※ attribute の部分は kind, purpose, place のどれかに読み替えること

### m_attribute_group

|カラム名|型|補足|インデックス|外部キー|説明|
|---|---|---|---|---|---|
|attribute_group_id|INT|PRIMARY KEY|あり||主キー|
|attribute_group_name|VARCHAR(20)|NOT NULL, UNIQUE|あり||識別するための名前|
|attribute_group_description|VARCHAR(20)|NOT NULL|なし||概要|

※ attribute の部分は kind, purpose, place のどれかに読み替えること

## DB 全体について

* ENGINE: InnoDB
* 文字コード: utf8mb4
* 照合順序: utf8mb4_bin

## ER 図

![erd](https://user-images.githubusercontent.com/42674772/96359066-3a1a0280-1149-11eb-9e2a-95ef2bd7df16.png)
