# DB ユーザーについて

## midas に関係するユーザー

### [midas] midas データベースの root 

データベース midas 配下に ALL PRIVILEGES と GRANT OPTION を付与したユーザー。

### [midas_api] API ユーザー
 
API 通信時に DB に接続するユーザー。
データベース midas 配下の SELECT と INSERT 権限を与えてある。

### [midas_backup] バックアップユーザー

バックアップ取得するユーザー。
データベース midas 配下の SELECT 権限のみを与えてある。
