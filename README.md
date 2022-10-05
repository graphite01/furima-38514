# テーブル設計

## users テーブル

| Column                             | Type    | Options                   |
| ---------------------------------- | ------- | --------------------------|
| email                              | string  | null: false, unique: true |
| encrypted_password                 | string  | null: false               |
| nickname                           | string  | null: false               |
| last_name_chinese                  | string  | null: false               |
| first_name_chinese                 | string  | null: false               |
| last_name_katakana                 | string  | null: false               |
| first_name_katakana                | string  | null: false               |
| date_of_birth_year_id(Activ Hash)  | integer | null: false               |
| date_of_birth_month_id(Activ Hash) | integer | null: false               |
| date_of_birth_day_id(Activ Hash)   | integer | null: false               |

### emailとencrypted_passwordに関しては、deviseで作成済みになる

### Association

- has_many :commodity_exhibitions
- has_many :product_purchases

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :date_of_birth_year
- belongs_to :date_of_birth_month
- belongs_to :date_of_birth_day

### Activ Hashのモデルに下記入力
- has_many :users


## commodity_exhibitions テーブル

| Column                                | Type       | Options                        |
| ------------------------------------- | ---------- | ------------------------------ |
| item_name                             | string     | null: false                    |
| explanation                           | text       | null: false                    |
| selling_price                         | string     | null: false                    |
| user_id                               | integer    | null: false, foreign_key: true |
| detail_category_id(Activ Hash)        | integer    | null: false                    |
| detail_situation_id(Activ Hash)       | integer    | null: false                    |
| delivery_charge_id(Activ Hash)        | integer    | null: false                    |
| shipping_origin_region_id(Activ Hash) | integer    | null: false                    |
| days_to_ship_id(Activ Hash)           | integer    | null: false                    |

### imageはActiveStorageで実装するため含まない

### Association

- has_one :product_purchase
- belongs_to :user

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to : detail_category
- belongs_to : detail_situation
- belongs_to :delivery_charge
- belongs_to :shipping_origin_region
- belongs_to : days_to_ship

### Activ Hashのモデルに下記入力
- has_many :commodity_exhibitions


## product_purchases テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| post_code                 | string     | null: false                    |
| municipalities            | string     | null: false                    |
| address                   | string     | null: false                    |
| building_name             | string     |                                |
| phone_number              | string     | null: false                    |
| user_id                   | references | null: false, foreign_key: true |
| commodity_exhibition_id   | references | null: false, foreign_key: true |
| prefecture_id(Activ Hash) | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :commodity_exhibition

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture

### Activ Hashのモデルに下記入力
- has_many :product_purchases

### クレジットカード情報はPAY.JPで管理,tokenを使用、モデル内(DBでは無い)に下記を入力
attr_accessor :token
validaes :token, presence: true