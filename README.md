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

## items テーブル

| Column          | Type   | Options                        |
| --------------- | ------ | ------------------------------ |
| itemsname       | string | null: false                    |
| category        | string | null: false                    |
| price           | string | null: false                    |
| status          | string | null: false                    |
| delivery_charge | string | null: false                    |
| prefecture      | string | null: false                    |
| date            | string | null: false                    |
| image           | text   | null: false                    |
| user            | string | null: false, foreign_key: true |

## purchases テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| item   | reference | null: false |
| user   | reference | null: false |

## address テーブル

| Column            | Type      | Options     |
| ----------------- | --------- | ----------- |
| item              | reference | null: false |
| user              | reference | null: false |
| client_prefecture | string    | null: false |
| client_city       | string    | null: false |
| client_local      | string    | null: false |
| client_building   | string    | null: false |
| phone_number      | string    | null: false |
