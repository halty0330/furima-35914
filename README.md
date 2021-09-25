# README

＃テーブル設計

## usersテーブル

|Column               | Type   | Options     |
|---------------------|--------|-------------|
|name                 | string | null:false  |
|e-mail               | string | null:false, unique: true |
|encrypted_password   | string | null:false  |
|birthday             | string | null:false  |


### Association
- has_many :items
- has_many :purchases
- has_many :shippings



## itemsテーブル

| Column              |Type    |Options     |
|---------------------|--------|------------|
|item_name            | string | null:false |
|price                | string | null:false |
|category             | string | null:false |
|explanation          | text   | null:false |
|condition            | string | null:false |
|fee                  | string | null:false |
|area                 | string | null:false |
|days                 | date   | null:false  |
|seller               | references |null:false, foreign_key :true|
|user_id              | references |null:false, foreign_key :true|


### Association
- has_one :purchases
- belongs_to :users


## purchasesテーブル

| Column              | Type   |Options     |
|---------------------|--------|------------|
|item_id              | string | null:false, foreign_key:true |
|buyer                | references | null:false, foreign_key :true|

 
### Association
- has_one :shippings
- belongs_to :items
- belongs_to :users


## shippingsテーブル

| Column              | Type   | Options     |
|---------------------|--------|-------------|
|prefectures          | string | null:false  |
|city                 | string | null:false  |
|address              | string | null:false  |
|code                 | string | null:false  |
|building_name        | string |
|telephone_number     | string | null:false  |


### Association
- belongs_to :users
- belongs_to :purchases

