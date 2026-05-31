# rails-todo-app

Railsで作成したTODO管理アプリです。


## 使用技術

- Ruby 3.3.11
- Rails 8.1.3
- PostgreSQL
- Render


## 機能

- ユーザー登録
- ログイン / ログアウト
- タスクCRUD
- タスク完了管理
- 完了日時自動設定
- バリデーション
- 認証必須制御

## 学習目的

Rails未経験状態から、
Webアプリの設計・実装・デプロイまで一通り経験する目的で作成。

## 学習・実装した内容

### Rails基礎

- MVC構成
- RESTful routing
- Strong Parameters
- before_action
- partial rendering

### ActiveRecord

- validation
- callback
- scope
- migration
- schema管理

### 認証

- sessionベース認証
- login_required実装
- パスワードハッシュ化

### 検証環境

- Renderへデプロイ
- PostgreSQL接続
- Environment Variables設定
- production環境でのDB migration
- db:seedによる初期ユーザー投入

## 工夫した点

### completed_at の自動更新

タスク完了時のみ completed_at を設定し、
未完了へ戻した場合は nil に戻す実装にした。

```ruby
before_save :set_completed_at

def set_completed_at
  if completed?
    self.completed_at ||= Time.current
  else
    self.completed_at = nil
  end
end
```

### production環境を意識した実装

- RAILS_MASTER_KEY を Environment Variables 化
- DATABASE_URL を利用した DB 接続
- secrets を GitHub 管理対象外に設定

## 今後改善したい点

- RSpec導入
- system spec
- N+1対策
- pagination
- Service Object導入
- Docker対応
- CI/CD
- AWS環境構築

## ローカル起動方法

```bash
git clone git@github.com:misato-enomoto/rails-todo-app.git

cd rails-todo-app

bundle install

bin/rails db:create
bin/rails db:migrate
bin/rails s
```

## ER図

（後で追加）

