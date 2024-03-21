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

| Column    | Type   | Options                        |
| --------- | ------ | ------------------------------ |
| itemsname | string | null: false                    |
| category  | string | null: false                    |
| price     | string | null: false                    |
| user      | string | null: false, foreign_key: true |

## purchases テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| item   | reference | null: false |
| user   | reference | null: false |
| date   | date      | null: false |

## purchases テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| item   | reference | null: false |
| user   | reference | null: false |
| date   | date      | null: false |

## address テーブル

| Column  | Type      | Options     |
| ------- | --------- | ----------- |
| address | text      | null: false |
| user    | reference | null: false |
