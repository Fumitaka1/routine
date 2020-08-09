# RORの学習用に作った習慣を共有するためのアプリ（にするつもり）の”routine”です

## 機能
- ユーザー（ユーザー管理はdevise）
 - 登録、変更、削除、一覧表示
 - 他ユーザーへのフォロー機能

- 記事（テキストと画像）
 - 投稿、変更、削除、一覧表示、タイトルでの検索
 - 記事へのブックマーク機能
 
- コメント投稿機能

## 開発環境
ubuntu 18.04.4
amazon linux(cloud9)

## 本番環境
本番環境はAWSのEC2(ubuntu 18.04.4)で動かしています。
DBはRDS(mysql 5.7.30)です
画像データはS3に格納しています

## 使用技術
- Ruby 2.6.6
- Rspec
- Rails 5.2.4
- mysql 5.30.7
- unicorn, nginx
- AWS
  - VPC
  - Route53
  - EC2
  - RDS
  - S3
- OWASP ZAPによる脆弱性診断
