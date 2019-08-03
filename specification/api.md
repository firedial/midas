
# API の仕様

現在 midas で使用できるリクエストをまとめたものとなる。

# balance テーブル操作(基本)

|メソッド|HTTP リクエスト|概要|
|---|---|---|
|GET|/api/v1/balance/|balance テーブルに入っているものを JSON 形式で返す|
|POST|/api/v1/balance/|JSON 形式で渡されたデータを balance テーブルに挿入する|

# balance テーブル操作(集計)

|メソッド|HTTP リクエスト|概要|
|---|---|---|
|GET|/api/v1/sum/?attributeName=[attributeName]|attributeName は無指定か、指定する際は "place" または "purpose" の値を指定し、その属性の id で balance テーブルを groupBy する|
|GET|/api/v1/sum/?groupByDate=[groupByDate]|groupByDate は無指定か、指定する際は "day" または "month" または "year" または "fiscal_year" の値を指定し、それぞれ日、月、年、年度で balance テーブルを groupBy する|
|GET|/api/v1/sum/?startDate=[startDate]|startDate は無指定か、指定する際は "yyyymmdd" 形式の文字列で集計対象の開始日付を指定する|
|GET|/api/v1/sum/?endDate=[endDate]|endDate は無指定か、指定する際は "yyyymmdd" 形式の文字列で集計対象の終了日付を指定する|

上の 4 つは組み合わせて使用することも可能。

# 属性テーブル

|メソッド|HTTP リクエスト|概要|
|---|---|---|
|GET|/api/v1/kind/|kind テーブルに入っているものを JSON 形式で返す|
|GET|/api/v1/purpose/|purpose テーブルに入っているものを JSON 形式で返す|
|GET|/api/v1/place/|place テーブルに入っているものを JSON 形式で返す|

