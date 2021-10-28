# README

## Deutsch（ドイチュ）
## URL  
http://18.180.76.171/home
## 概要
ドイツ語の総合学習サイトです。  
音声を聞きながらテキストを読んで、効率良く学習しましょう。  
わからない事があれば質問もできます。  
さあ、ドイツ語の旅に出かけましょう！  
![8492f1fffe353f17be38d5cb95e617f8](https://user-images.githubusercontent.com/66251668/139196238-2df8c5c5-4df5-45b1-8d2d-3d95da0fb46b.jpeg)

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|image_name|string|null: false|
## Association
- has_many :posts
- has_many :comments
- has_many :likes

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|foreign_key: true|
## Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|post_id|references|foreign_key: true|
|text|text|null: false|
## Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|post_id|references|foreign_key: true|
## Association
- belongs_to :user

# 使用技術
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- MySQL 5.6.50
- Nginx
- Puma
- AWS
- Capistorano
- RSpec

# 機能一覧
- ユーザー・プロフィール画像登録機能
- ログイン・ログアウト機能
- 質問投稿機能
- コメント機能
- いいね機能
- スライド機能
- 音声再生機能
- アコーディオンパネル機能
- ページネーション機能
- 単語インデックス検索機能
- ツールチップ機能

# テスト
- RSpec
 - 単体テスト（model, controller）
 - 統合テスト（feature）
