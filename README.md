# DB 設計
## commentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|article_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :article

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :comments
- has_many :articles

## articleテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|
|image|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
