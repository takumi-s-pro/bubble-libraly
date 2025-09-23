# README
# アプリケーション名
泡沫文庫
Bubble Library

# アプリケーション概要
・1000文字以内の短編小説を投稿・閲覧できる

# URL
https://github.com/takumi-s-pro/bubble-libraly

# テスト用アカウント
BASIC認証
ID:admin
password:test1234

# 利用方法
 1.トップページのヘッダーからユーザー新規登録を行う
 2.新規投稿ボタンから、小説を投稿する
 3.投稿した小説が指定した時間(デフォルトでは24時間後)に削除される

# アプリケーションを作成した背景
・時間のかかる読書をなるべく手軽に楽しめるようにしたい

# 実装した機能についての画像やGIFおよびその説明
・投稿した内容が指定時間になったら削除される動画

# 実装予定の機能
・いいね機能
・ユーザーフォロー機能

# データベース設計
![alt text](image.png)
# 画面遷移図
![alt text](image-1.png)
# 開発環境
 ・フロントエンド
 ・バックエンド
 ・テスト環境
 ・インフラ
 ・テキストエディタ
 ・タスク管理

# ローカルでの動作方法
以下のコマンドを実行
% git clone 
% cd bubble library
% bundle install
% rails db:create
% rails db:migrate
% rails s

# 工夫したポイント

# 改善点
 ・UI改善
   文字色、背景色の改善

 ・実装予定機能
   マイページ機能
   いいね機能
   ユーザーフォロー機能

# 制作時間
 約10日

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