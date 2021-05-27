# README
# アプリケーション名
  Inspection Record

# アプリケーション概要
  現職の業務を効率化、ペーパーレス化させたいという思いから作成いたしました。
  紙で管理している分析結果をデータ化し、ペーパーレス化する。書類は簡単一発作成。
# URL
  http://54.150.81.120/

# 動作環境・使用技術
- HTML/CSS
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 5.6.50
- AWS(EC2)
- Unicorn 5.4.1
- Nginx 1.18.0
- CircleCI 2.1
- GitHub

## テスト用アカウント
  ゲストユーザーログイン機能があるため、テスト用アカウントなし

# 利用方法
  - 1.適当な6桁の半角数字(INコード)とカテゴリを選択してアイテムを登録
  - 2.当日生産品リストに今日生産するアイテムをINコードで登録(今日の日付が自動で紐づけられます)
  - 3.リストに入れたアイテムの分析値を入力できます
  - 4.過去の入力されたデータはINコードから検索
  - 5.検索したデータの詳細ページからPDFを出力

# 目指した課題解決
  現職の品質管理部で主に製品の分析業務を行っているが、分析データは全て紙で保存することになっている。
  紙を利用することの利点もあるが、消費期限等の関係で最長5年も保存する上で場所の確保も必要となり、毎日の分析業務のほか、ファイルの整理等も必要となる。また、分析データを利用することや取引先にデータを提出することもあるが、ファイルから一つ一つ探し出さなければならず、正確に写し上司に正確に記載してあるか確認してもらわねばならない体制となっている。そこで、紙で扱っている物を全てデータ化し利用することで、日々の業務の効率化やペーパーレス化を目指すことができると考えた。

# 要件定義
- ユーザーログイン機能
- ゲストユーザーログイン機能
- 新規製品登録機能
- 当日生産品リスト化機能
- 分析値入力機能
- 検索機能(ransack)
- PDF出力機能(wkhtmltopdf-binary, wicked_pdf)
- フラッシュメッセージ機能
- Rspecによるテスト機能
- Rubocopによる静的コード解析
- CircleCIによる自動CI/CDパイプライン構築

https://docs.google.com/spreadsheets/d/1z4aXm-Gv8Rccz6zwAibyUP6e90YPUK5DqEL8jboQw54/edit?usp=sharing

# 実装予定
- セキュリティー対策(SSL化)
- 通知機能
- 非同期通信
- Dockerによる開発環境の完全コンテナ化

# データベース設計
## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| number_id          | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| in_charge1_id      | integer |                           |
| in_charge2_id      | integer |                           |
| in_charge3_id      | integer |                           |

### Association
- has_many :notifications

## itemsテーブル
| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| incode           | string  | null: false, unique: true |
| name             | string  | null: false               |
| main_category_id | integer | null: false               |
| sub_category_id  | integer | null: false               |

### Association
- has_many :analyses
- has_many :item_lists
- ham_many :lists, through: :item_lists

## item_listsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| list_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :list

## listsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| incode        | string     | null: false                    |
| date          | date       | null: false                    |
| item_id       | references | null: false, foreign_key: true |

### Association
- has_many :item_lists
- has_many :items, through: :item_lists

## Analysesテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_id              | references | null: false, foreign_key: true |
| list_id              | references | null: false, foreign_key: true |
| tankno               | string     | null: false                    |
| density              | float      | null: false                    |
| alcohol              | float      | null: false                    |
| extract              | float      | null: false                    |
| acid_degree          | float      |                                |
| amino_acid           | float      |                                |
| color                | float      |                                |
| nacl                 | float      |                                |
| turbidity            | float      |                                |
| free_sulfurous_acid  | float      |                                |
| total_sulfurous_acid | float      |                                |
| comment              | text       |                                |

### Association
- belongs_to :item
- belongs_to :list
- has_one :notification

## Notificationsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| analysis_id | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |
| action      | string     | null: false                    |
| checked     | boolean    | default: false, null: false    |

### Association
- belongs_to :analysis
- belongs_to :user
