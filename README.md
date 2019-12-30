# TLAVEL PHOTO
複数枚の写真を、位置情報つきで投稿できるサービスです。
就職活動用のポートフォリオとして制作致しました。

![Screen_shot](https://user-images.githubusercontent.com/44374005/71571357-2f8c6f00-2b1d-11ea-97ec-d0a6938dc2b9.png)

# リンク
http://travelphoto.work
ログインページの下部の、簡単ログインボタンから、サンプルユーザーとしてログインできます。


# 使用技術
- Ruby 2.6.2
- Ruby on Rails 6.2.3
- postgreSQL 11.5
- Nginx
- AWS
  - VPC
  - EC2
  - ECS
  - ECR
  - ALB
  - RDS
  - S3
  - Route53
  - VPC
  - CloudWatch
- Docker
- CircleCI
- GitHub

# クラウドアーキテクチャ
![architecture](https://user-images.githubusercontent.com/44374005/71571222-93fafe80-2b1c-11ea-9f27-3428010a3da3.png)

- CircleCIでは、githubのpush時に、Rspecによる自動テストを実行しています。
- masterブランチへのプッシュでは、Rspecによるテストと、ECR,ECSへのデプロイが実行されます。

# Github
- 途中から、master,develop,featureブランチで分けて本番を意識して開発しました。

# 機能一覧、使用したgemなど
- 投稿機能
  - 投稿機能
  - 複数枚の写真の投稿機能
  - 位置情報の検索機能(geocoder)
  - 投稿編集機能
  - 投稿削除機能
  - 投稿検索機能
- コメント機能(Ajax)
  - コメント投稿機能
  - コメント編集機能
  - コメント削除機能
- ユーザー登録機能(devise)
  - マイページ機能
    - プロフィール編集機能
      - プロフィール画像変更時の、プレビュー機能
    - ユーザ検索機能
- ページネーション機能(kaminari)
  - もっと見るボタン(Ajax)
- いいね機能(Ajax)
  - 投稿いいね機能
- フォロー機能(Ajax)
- タグ機能（acts-as-taggable-on）

# テスト
- RSpec
  - 機能テスト(request spec)
  - 統合テスト(system spec)