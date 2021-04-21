# README
# アプリケーション名
  BusinessImprovement

# URL
  http://54.150.81.120/

## テスト用アカウント
  ゲストユーザーログイン機能あり

# 利用方法

# 目指した課題解決
  
# 要件定義

# 実装予定機能

# データベース設計
## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| number_id          | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| In_charge1         | integer |                           |
| In_charge2         | integer |                           |
| In_charge3         | integer |                           |

### Association
- has_many :notifications

## itemsテーブル
| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| incode        | integer | null: false, unique: true |
| name          | string  | null: false               |
| main_category | integer | null: false               |
| sub_category  | integer | null: false               |

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
| incode        | integer    | null: false                    |
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

# 動作環境
  Ruby 2.6.5
  Ruby on Rails 6.0.0
  AWS
  Unicorn
  Nginx