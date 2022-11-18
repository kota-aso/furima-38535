# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| nickname           | string   | null: false                |
| email              | string   | null: false, unique: true	 |
| encrypted_password | string   | null: false                |
| family_name_kanji  | string   | null: false                |
| first_name_kanji   | string   | null: false                |
| family_name_kana   | string   | null: false                |
| first_name_kana    | string   | null: false                |
| birth              | date     | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| item_name           | string     | null: false                      |
| item_description    | text       | null: false                      |
| item_category_id    | integer    | null: false                      |
| item_status_id      | integer    | null: false                      |
| shipping_charger_id | integer    | null: false                      |
| prefecture_id       | integer    | null: false                      |
| days_to_ship_id     | integer    | null: false                      |
| price               | integer    | null: false                      |
| user                | references | null: false, foreign_key: true	  |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id | interer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association

- belongs_to :order
