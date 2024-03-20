# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| firstname          | string | null: false               |
| lastname           | string | null: false               |
| birth              | string | null: false               |

## items テーブル

| Column    | Type   | Options                        |
| --------- | ------ | ------------------------------ |
| itemsname | string | null: false                    |
| category  | string | null: false                    |
| price     | string | null: false                    |
| user      | string | null: false, foreign_key: true |
