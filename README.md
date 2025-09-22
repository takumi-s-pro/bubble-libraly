# README
# アプリケーション名
泡沫文庫
Bubble Library

# アプリケーション概要
・
# URL

# テスト用アカウント
BASIC認証
ID:admin
password:test1234

# 利用方法
・
・

# アプリケーションを作成した背景

# 実装した機能についての画像やGIFおよびその説明
・投稿した内容が指定時間になったら削除される動画

# 実装予定の機能
・いいね機能
・ユーザーフォロー機能

# データベース設計

# 画面遷移図

# 開発環境

# ローカルでの動作方法

# 工夫したポイント

# 改善点

# 制作時間
### テーブル一覧

#### 1. usersテーブル
| カラム名            | 型         | 制約                       | 説明                  |
|--------------------|------------|----------------------------|----------------------|
| nickname           | string     | null: false                | ニックネーム          |
| email              | string     | null: false, unique: true  | メール               |
| encrypted_password | string     | null: false                | パスワード            |
| profile            | text       |                            | 自己紹介文            |


### Association
has_many :novels


#### 1. novelsテーブル
| カラム名    | 型         | 制約                       | 説明                |
|------------|------------|----------------------------|--------------------|
| title      | string     | null: false                | タイトル            |
| content    | text       | null: false                | 本文(1000文字以内)  |
| user_id    | integer    | null: false,FOREIGN KEY    | 投稿者ID            |
| created_at | datetime   | null: false                | 投稿日時            |
| updated_at | datetime   | null: false                | 更新日時            |
| expires_at | datetime   | null: false                | 自動削除日時        |


### Association
belongs_to :users