# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| firstname          | string | null: false               |
| lastname           | string | null: false               |
| firstname_kana     | string | null: false               |
| lastname_kana      | string | null: false               |
| birth              | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| itemsName          | string     | null: false                    |
| itemsFeature       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| schedule_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| purchase        | references | null: false, foreign_key: true |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| client_city     | string     | null: false                    |
| client_local    | string     | null: false                    |
| client_building | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :purchase
