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

| Colum              | Type   |Options                 |
| -------------------| ------ | ---------------------- |
| email              | string | NOT NULL, unique: true |
| encrypted_password | string | NOT NULL               |
| name               | string | NOT NULL               |

has_many :items
has_many :purchase_records

## itemsテーブル

| Colum                | Type       |Options                     |
| ---------------------| -----------| -------------------------- |
| products             | string     | NOT NULL                   | 
| products_explanation | text       | NOT NULL                   |
| products_detail      | text       | NOT NULL                   |
| price                | text       | NOT NULL                   |
| user                 | references | NOT NULL foreign_key: true |

belongs_to :user
has_one :shipping_address
has_one :purchase_record

## purchase_recordsテーブル
| Colum              | Type       |Options                     |
| -------------------| ---------- | -------------------------- |
| user               | references | NOT NULL foreign_key: true |
| item               | references | NOT NULL foreign_key: true |

belongs_to :user
belongs_to :item


## shipping_addresses
| Colum              | Type   |Options                 |
| -------------------| ------ | ---------------------- |
| postal_code        | string | NOT NULL               |
| prefecture_id      | string | NOT NULL               |
| city               | string | NOT NULL               |
| block              | string | NOT NULL               |
| building           | string |                        |
| phone_number       | string | NOT NULL               |

has_many :items

