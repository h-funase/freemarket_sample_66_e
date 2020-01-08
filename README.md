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
| firs_tname   | string | null: false        |
| last_name    | string | null: false        |
| first_name_kana | string | null: false        |
| last_name_kana | string | null: false        |
| address    | text  | null: false        |
| birthday    | date  | null: false        |
| phone     | integer | null: false, unique: true, index: true|
### Association
- has_many :items
- has_many :comments
- has_many :likes
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
| A-category_id  | integer | null: false, foreign_key: true |
| B-category_id  | integer | null: false, foreign_key: true |
| C-category_id  | integer | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to :A-category
- belongs_to :brand
## commentsテーブル
| Column | Type  | Options            |
|---------|---------|--------------------------------|
| coment | string | null: false          |
| user_id | inreger | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |
### Associstion
- belongs_to :user
- belongs_to :item
## likesテーブル
| Column | Type  | Options            |
|---------|---------|--------------------------------|
| user_id | inreger | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |
### Associstion
- belongs_to :user
- belongs_to :item
## A-categoryテーブル
| Column | Type  | Options   |
|---------|---------|-------------|
| name  | string | null: false |
### Associstion
- has_many :items
- has_many :B-category
- belongs_to :C-category
## B-categoryテーブル
| Column    | Type  | Options            |
|---------------|---------|--------------------------------|
| name     | string | null: false          |
| A-category_id | integer | null: false, foreign_key: true |
### Associstion
- belongs_to :A-category
- has_many :C-category
## C-categoryテーブル
| Column | Type  | Options               |
|---------|---------|--------------------------------------|
| name  | string | null: false             |
| B-category_id | integer | null: false, foreign_key: true |
### Associstion
- belongs_to :B-category
- belongs_to :A-category
## brandテーブル
| Column | Type  | Options   |
|---------|---------|-------------|
| name  | string | null: false |
### Associstion
- has_many :items

