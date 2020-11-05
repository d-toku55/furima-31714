# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| encrypted_password  | string | null: false |
| family_name         | string | null: false |
| first_name          | string | null: false |
| family_name_reading | string | null: false |
| first_name_reading  | string | null: false |
| nickname            | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :record

## items テーブル

| Column          | Type               | Options                        |
| --------------- | ------------------ | ------------------------------ |
| title           | string             | null: false                    |
| text            | text               | null: false                    |
| price           | integer            | null: false                    |
| status          | string             | null: false                    |
| category        | string             | null: false                    |
| delivery_area   | string             | null: false                    |
| delivery_days   | string             | null: false                    |
| delivery_burden | integer            | null: false                    |
| user            | references         | null: false, foreign_key: true |
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

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefectures_id | integer    | null: false |
| municipality   | string     | null: false |
| address        | string     | null: false |
| building_name  | string     |             |
| phone_number   | string     | null: false |
| record         | references |             |

### Association

- belongs_to :record