# README

# テーブル設計

## users テーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_year       | integer| null: false |
| birth_month      | integer| null: false |
| birth_day        | integer| null: false |

### Association
- has_many :products
- has_many :purchases_info
- has_one :users_login


## products テーブル
| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| product_name         | string | null: false |
| product_explanation  | text   | null: false |
| category_id          | string | null: false |
| condition            | integer| null: false |
| shipping_burden      | integer| null: false |
| shipping_origin      | integer| null: false |
| days_until_shipping  | integer| null: false |
| price                | string | null: false |
| sales_commission     | string | null: false |
| sales_profit         | string | null: false |
| user_id              | integer| null: false |

### Association
- belongs_to :user


## purchases_info テーブル
| Column        | Type       | Options      |
| ------------- | ---------- | -------------|
| postal_code   | string     | null: false  |
| prefectures   | integer    | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     |              |
| phone_number  | string     | null: false  |
| product_id    | integer    | null: false  |

### Association
- belongs_to :products


## users_login テーブル
| Column        | Type    | Options      |
| ------------- | --------| -------------|
| user_id       | integer | null: false  |
| email         | integer | null: false  |

### Association
- belongs_to :user



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
_6.0.3.2_
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
