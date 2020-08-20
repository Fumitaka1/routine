# RORの学習用に作ったマイクロブログアプリの*routine*です

### https://routine.gq/

## 機能
- ユーザー（ユーザー管理はdevise）
  - 登録、変更、削除、一覧表示
  - 他ユーザーへのフォロー機能
  - 「簡単ログイン」ボタンでテストユーザーとしてログイン出来ます

- 記事（テキストと画像）
  - 投稿、変更、削除、一覧表示、タイトルでの検索
  - 記事へのブックマーク機能
 
- コメント
  - 投稿、変更、削除、一覧表示
  
- ブックマーク機能

## 開発環境
ubuntu 18.04.4
amazon linux(cloud9)

## 本番環境
本番環境はAWSでECSを介したEC2(amazon linux 2)です。

DBはRDS(mysql 5.7.30)です。

記事の画像データはS3に格納しています。

### AWS構成図
![デモ](https://github.com/Fumitaka1/routine_old/blob/images/my_env.jpg?raw=true)


## 使用技術
- Ruby 2.6.6
- Rspec
- Rails 5.2.4
- mysql 5.30.7
- unicorn, nginx
- AWS
  - VPC
  - Route53
  - IAM
  - ECS, ECR
  - EC2, ELB, ACM
  - RDS
  - S3
- OWASP ZAPによる脆弱性診断
