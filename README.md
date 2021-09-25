# README

＃テーブル設計

## usersテーブル

|Column               | Type   | Options     |
|---------------------|--------|-------------|
|last_name            | string | null:false  |
|name                 | string | null:false  |
|last_furigana        | string | null:false  |
|name_furigana        | string | null:false  |
|email                | string | null:false, unique: true |
|encrypted_password   | string | null:false  |
|birthday             | date   | null:false  |


### Association
- has_many :items
- has_many :purchases



## itemsテーブル

| Column              |Type    |Options     |
|---------------------|--------|------------|
|item_name            | string | null:false |
|price                | integer | null:false |
|category_id          | integer | null:false |
|explanation          | text   | null:false |
|condition_id         | integer | null:false |
|fee_id               | integer | null:false |
|area_id              | integer | null:false |
|date_id              | integer   | null:false  |
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
|area_id              | integer | null:false  |
|city                 | string | null:false  |
|address              | string | null:false  |
|code                 | string | null:false  |
|building_name        | string |
|telephone_number     | string | null:false  |
|purchase_id          | string | null:false, foreign_key:true |

### Association
- belongs_to :purchase

