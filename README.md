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
<!-- フリマアプリ「メルカリ」のクローンサイト -->
## usersテーブル
| Column     | Type  | Options          |
|----------------|---------|---------------------------|
| nickname    | string | null: false |
| email     | string | null: false, unique: true, index: true |
| password    | string | null: false        |
| first_tname   | string | null: false        |
| last_name    | string | null: false        |
| first_name_kana | string | null: false        |
| last_name_kana | string | null: false        |
| address    | string  | null: false        |
| birthday    | date  | null: false        |
| phone     | integer | null: false, unique: true, index: true|
### Association
- has_many :items
- has_many :comments
- has_many :likes
- belongs_to :card
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

## itemsテーブル
| Column     | Type  | Options            |
|-----------------|---------|--------------------------------|
| name      | string | null: false, index: true    |
| prise      | integer | null: false          |
| description   | text  | null: false          |
| like      | integer | null: false          |
| status     | integer | null: false          |
| location    | string | null: false          |
| image      | string | null: false          |
| delivery charge | integer | null: false          |
| status | integer | null: false          |
| top_category_id  | integer | null: false, foreign_key: true |
| middle_category_id  | integer | null: false, foreign_key: true |
| bottom_category_id  | integer | null: false, foreign_key: true |
| saler_id | integer | null: false, foreign_key: true |
| buyer_id | integer | foreign_key: true |
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to :top_category
- belongs_to :brand
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
## commentsテーブル
| Column | Type  | Options            |
|---------|---------|--------------------------------|
| comment | string | null: false          |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
## likesテーブル
| Column | Type  | Options            |
|---------|---------|--------------------------------|
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
## top_categoryテーブル
| Column | Type  | Options   |
|---------|---------|-------------|
| name  | string | null: false |
### Association
- has_many :items
- has_many :middle_category
- belongs_to :bottom_category
## middle_categoryテーブル
| Column    | Type  | Options            |
|---------------|---------|--------------------------------|
| name     | string | null: false          |
| top_category_id | integer | null: false, foreign_key: true |
### Association
- belongs_to :top_category
- has_many :bottom_category
## bottom_categoryテーブル
| Column | Type  | Options               |
|---------|---------|--------------------------------------|
| name  | string | null: false             |
| middle_category_id | integer | null: false, foreign_key: true |
### Association
- belongs_to :middle_category
- belongs_to :top_category
## brandsテーブル
| Column | Type  | Options   |
|---------|---------|-------------|
| name  | string | null: false |
### Association
- has_many :items
## cardsテーブル
| Column | Type | Option |
|---------|-------|------|
| user_id | integer | null: false |
| customor_id | string | null: false |
| card_id | string | null: false |
### Asosiation
- belongs_to :user

