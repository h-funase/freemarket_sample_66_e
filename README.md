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
| first_name   | string | null: false        |
| last_name    | string | null: false        |
| first_name_kana | string | null: false        |
| last_name_kana | string | null: false        |
| birthday    | date  | null: false        |
| phone     | integer | null: false, unique: true, index: true|
### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_one :card
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_one :address

## Addressesテーブル
| Column | Type | Options |
|--------|------|---------|
| user_id | integer | null: false,foreign_key:true |
| postal_code | integer | null: false |
| prefectures | string | null:false |
| municipality | string | null:false |
| street_number | string | null:false |
| building_name | string |            |
### Association
- belongs_to :user 

## itemsテーブル
| Column     | Type  | Options            |
|-----------------|---------|--------------------------------|
| name      | string | null: false, index: true    |
| price      | integer | null: false          |
| description   | text  | null: false          |
| like      | integer | null: false          |
| status     | integer | null: false          |
| location    | string | null: false          |
| delivery_charge | integer | null: false          |
| category_id | integer | null: false, foreign_key |
| saler_id | integer | null: false, foreign_key: true |
| buyer_id | integer | foreign_key: true |
| brand_id | integer | foreign_key: true |
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to :top_category
- belongs_to :brand
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :images
- belongs_to :category

## imagesテーブル
| Colimn | Type | Options |
|--------|------|---------|
| item_id | integer | foreign_key |
| name | string | null: false |
### Association
- belongs_to :item

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

## Categorysテーブル
| Column | Type | Option |
|--------|------|--------|
| name | string | null:false |
| ancestry | string | index: true |
### Association
- has_many :items
- has_ancestry
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
| customer_id | string | null: false |
| card_id | string | null: false |
### Asosiation
- belongs_to :user

