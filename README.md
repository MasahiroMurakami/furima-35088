# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |


### Association

- has_many :buyer_histories
- has_many :items, through: :buyer_histories dependent: :destroy

## orders テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| post_code        | string        | null: false                    |
| prefecture_id    | integer       | null: false                    |
| city             | string        | null: false                    |
| addresses        | string        | null: false                    |
| building         | string        |                                |
| phone_number     | string        | null: false                    |
| item_id          | integer       | null: false, foreign_key: true |

### Association

- belongs_to :buyer_history

## buyer_histories テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false                    |
| item_id         | integer | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## items テーブル

| Column                       | Type          | Options                        |
| ---------------------------- | ------------- | ------------------------------ |
| item_name                    | string        | null: false                    |
| item_info                    | string        | null: false                    |
| item_category_id             | integer       | null: false                    |
| item_sales_status_id         | integer       | null: false                    |
| item_shipping_free_status_id | integer       | null: false                    |
| item_prefecture_id           | integer       | null: false                    |
| item_scheduled_delivery_id   | integer       | null: false                    |
| item_price_id                | integer       | null: false                    |
| prefecture_id                | integer       | null: false                    |
| user_id                      | integer       | null: false, foreign_key: true |

### Association
- has_one :buyer_history
- belongs_to :user
