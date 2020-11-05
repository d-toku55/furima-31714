# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| nickname   | string | null: false |
| birthday   |        | null: false |

### Association

- has_many :items
- has_many :record

## items テーブル

| Column     | Type               | Options                        |
| ---------- | ------------------ | ------------------------------ |
| title      | string             | null: false                    |
| text       | text               | null: false                    |
| price      | integer            | null: false                    |
| user       | references         | null: false, foreign_key: true |
| image      | ActiveStorageで実装 | null: false                    |
| status     |                    | null: false                    |

### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options     |
| --------------| ---------- | ----------- |
| postal_code   | string     | null: false |
| prefectures   |            | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| record        | references |             |

### Association

- belongs_to :record