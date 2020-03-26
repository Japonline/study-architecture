# 環境セットアップ

## リポジトリをclone

## docker-compose起動確認

```sh
docker-compose up
```

docker-composeを終了させる場合は`docker-compose down`

※一度docker-composeをdownさせ、以後は`docker-compose up -d`でバックグラウンド起動する

## mysqlコンテナでデータベースの確認

### コンテナに入る

```sh
docker-compose exec mysql sh
```

### mysqlログイン

```sh
mysql -u root -p
```

*パスワードは別途

### データベース確認（architectureが存在するか）

```sh
mysql> show databases;
```

### データベースが存在しない場合

```sh
mysql> create database architecture;
```

## .envの修正

```txt
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=architecture
DB_USERNAME=root
DB_PASSWORD=root
```

## phpコンテナで各種インストール

### コンテナに入る

```sh
docker-compose exec php-fpm sh
```

### コンテナ内で

Laravelインストール

```sh
composer install
php artisan key:generate
php artisan migrate
```

`php artisan migrate`に失敗する場合はDBとの疎通がうまく行っていない可能性あり。
`docker ps`の結果を添えてお問い合わせください。

```sh
php artisan db:seed
```

以降、DBのマイグレーションとシードを毎回行う場合、以下のコマンドを実行する。
DBを削除して再生成＆シーダー投入を行う。
マイグレーションやシード投入がうまく行かない場合も一度以下のコマンドを試す。

```sh
php artisan migrate:fresh --seed
```

## Laravel起動確認

```sh
open http://localhost:12100
```
