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
- has_many :purchases, through: :item_users
- belong_to :address

## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| itemsname          | string    | null: false                    |
| itemsfeature       | text      | null: false                    |
| category           | string    | null: false                    |
| price              | integer   | null: false                    |
| status_id          | integer   | null: false                    |
| delivery_charge_id | integer   | null: false                    |
| prefecture_id      | integer   | null: false                    |
| date               | string    | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association

- has_many :users, through: :item_users
- belong_to :purchase
- belong_to :address

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## purchases テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| item   | reference | null: false, foreign_key: true |
| user   | reference | null: false, foreign_key: true |

### Association

- has_many :users
- belong_to :item
- belong_to :address

## address テーブル

| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| item            | reference | null: false |
| user            | reference | null: false |
| post_code       | integer   | null: false |
| prefecture_id   | integer   | null: false |
| client_city     | string    | null: false |
| client_local    | string    | null: false |
| client_building | string    |             |
| phone_number    | string    | null: false |

### Association

- belong_to :user
- belong_to :item
- belong_to :purchase
