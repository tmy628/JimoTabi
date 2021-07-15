# :handbag:じもたび:handbag:

<img width="1439" alt="top_screen" src="https://user-images.githubusercontent.com/78731929/125794926-17cb8c55-ee20-45d6-8385-1e8bc19d7daa.png">

## :black_nib:サイト概要
絶景スポットや知られざる穴場スポット、おすすめのご当地料理や名産品、伝統文化や工芸品など  
身近にあるけれどまだ知られていない地元地域に関するあらゆる情報を共有できるサービス  

### :mega:サイトテーマ
地元の情報を共有し、隠れた魅力を再発見するためのサイト

### :thought_balloon:テーマを選んだ理由
2021年6月1日現在、新型コロナウイルスの感染拡大により、多くの人が都道府県をまたぐ移動の自粛を続けています。  
感染拡大への懸念から旅行への気持ちが遠のいてしまっている人が多いと思います。  
しかし、海外や国内の遠方まで出かけなくても、地域の文化を体験したり、名産品を味わったりすれば  
地元の魅力や良さに改めて気付くことができると考えています。  
地元を旅して、まだ見たことのない、体験したことのない地元の魅力を再発見してもらいたいという想いから  
そのきっかけとなるようなサービスを開発しようと思い立ちました。  

### :busts_in_silhouette:ターゲットユーザ
* 感染拡大への懸念から旅行への気持ちが遠のいてしまっている人  
* まだ知られていない地元の魅力を発見したい人、発見してもらいたい人  

### :exclamation:主な利用シーン
* 地元の魅力をPRしたい時  
* 地元の魅力をもっと知りたい時  

## :page_facing_up:設計書
* [テーブル定義書](https://docs.google.com/spreadsheets/d/1VM6QD9EQiTuTyAFOofIaC3fqfjNhObXaFDNfPOC31io/edit?usp=sharing)

* [詳細設計書](https://docs.google.com/spreadsheets/d/1rCL9-8wE-GLDfJ0CcCVcn4DBeaqopzvbOcJGxBY1QvY/edit?usp=sharing)

* [ER図](https://drive.google.com/file/d/1tZh4HRx65gmpRIa9W8cx6RMiD9tL5HVu/view?usp=sharing)

## :clipboard:機能一覧
* ユーザー認証（devise）
  * 日本語化
  * ゲストログイン
* 投稿機能
  * 画像投稿（refile）
* タグ機能
  * タグ付け
  * タグ絞り込み
* 地図機能（Google Maps API）
  * Google Maps をウェブサイトに表示（Maps JavaScript API）
  * 住所を緯度・経度（または緯度経度を住所）に変換（Geocoding API）
* お気に入り機能（Ajax）
  * お気に入り投稿一覧表示
* コメント機能（Ajax）
  * コメント一覧表示
* ページング機能（kaminari）
* 投稿の検索機能
* 自動デプロイ（GitHub Actions）

## :pencil:テスト
* RSpec
  * 単体テスト（Model）

## :memo:チャレンジ要素一覧
[チャレンジ要素一覧](https://docs.google.com/spreadsheets/d/1bqjuwU3awUpVLLA4hL59Zucu-KbCZacArA0iaqQYe4Q/edit?usp=sharing)

## :computer:開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- ライブラリ：jQuery
- IDE：Cloud9

## :open_file_folder:使用素材
* [フリー素材ブログ](https://www.shoshinsha-design.com/)

* [ぱくたそ](https://www.pakutaso.com/)

* [photoAC](https://www.photo-ac.com/)

* [illustAC](https://www.ac-illust.com/)
