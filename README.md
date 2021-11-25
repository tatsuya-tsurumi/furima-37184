# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

| Colum              | Type   |Options                    |
| -------------------| ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

has_many :items
has_many :purchase_records

## itemsテーブル

| Colum                     | Type       |Options                        |
| --------------------------| -----------| ----------------------------- |
| products                  | string     | null: false                   | 
| products_explanation      | text       | null: false                   |
| catefory                  | string     | null: false                   | 
| state                     | string     | null: false                   | 
| postgate                  | string     | null: false                   | 
| region                    | string     | null: false                   | 
| shipping_data             | string     | null: false                   | 
| price                     | integer    | null: false                   |
| user                      | references | null: false foreign_key: true |

belongs_to :user
has_one :purchase_record

## purchase_recordsテーブル
| Colum                 | Type       |Options                        |
| ----------------------| ---------- | ----------------------------- |
| user                  | references | null: false foreign_key: true |
| item                  | references | null: false foreign_key: true |
| shipping_addresses_id | references | null: false foreign_key: true |

belongs_to :user
belongs_to :item
has_one :shipping_address


## shipping_addresses
| Colum              | Type       |Options                        |
| -------------------| ---------- | ----------------------------- |
| postal_code        | string     | null: false                   |
| prefecture_id      | string     | null: false                   |
| city               | string     | null: false                   |
| block              | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |
| purchase_records   | references | null: false foreign_key: true |

belongs_to :purchase_record
