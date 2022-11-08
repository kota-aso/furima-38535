# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| nickname           | string   | null: false                |
| email              | string   | null: false, unique: true	 |
| encrypted_password | string   | null: false                |
| family_name(kanji) | string   | null: false                |
| first_name(kanji)  | string   | null: false                |
| family_name(kana)  | string   | null: false                |
| first_name(kana)   | string   | null: false                |
| birth              | datetime | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| item_name        | string     | null: false                      |
| item_description | text       | null: false                      |
| item_category    | string     | null: false                      |
| item_status      | string     | null: false                      |
| shipping_charger | string     | null: false                      |
| ship_from        | string     | null: false                      |
| days_to_ship     | string     | null: false                      |
| price            | integer    | null: false                      |
| user             | references | null: false, foreign_key: true	 |

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
- has_one :shipping_address


## shipping_addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| post_code    | string     | null: false |
| prefectural  | string     | null: false |
| city         | string     | null: false |
| street       | string     | null: false |
| building     | string     | null: false |
| phone_number | integer    | null: false |


### Association

- belongs_to :order
