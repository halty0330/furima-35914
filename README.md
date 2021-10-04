# README

＃テーブル設計

## usersテーブル

|Column               | Type   | Options     |
|---------------------|--------|-------------|
|nickname             | string | null:false  |
|last_name            | string | null:false  |
|first_name           | string | null:false  |
|last_name_furigana   | string | null:false  |
|first_name_furigana  | string | null:false  |
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
|scheduled_day_id     | integer   | null:false |
|user                 | references |null:false, foreign_key :true|


### Association
- has_one :purchase
- belongs_to :user


## purchasesテーブル

| Column              | Type   |Options     |
|---------------------|--------|------------|
|item                 | references | null:false, foreign_key:true |
|buyer                | references | null:false, foreign_key :true|

 
### Association
- has_one :shippings
- belongs_to :item
- belongs_to :user


## shippingsテーブル

| Column              | Type   | Options     |
|---------------------|--------|-------------|
|area_id              | integer | null:false  |
|city                 | string | null:false  |
|address              | string | null:false  |
|code                 | string | null:false  |
|building_name        | string |
|telephone_number     | string | null:false  |
|purchase             | references | null:false, foreign_key:true |

### Association
- belongs_to :purchase

