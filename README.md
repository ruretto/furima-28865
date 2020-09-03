# README

# テーブル設計

## users テーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :products
- has_many :item_purchases
- has_many :comments


## products テーブル
| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| product_image        | string | null: false |
| product_name         | string | null: false |
| product_explanation  | string | null: false |
| category_id          | string | null: false |
| condition            | string | null: false |


### Association

- has_many :products
- has_many :item_purchases
- has_many :comments


## purchase_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- has_one_active_hash :prefectures
- has_one :item_purchase


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
