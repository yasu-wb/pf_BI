# README

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

## listsテーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item_id       | integer | null: false, foreign_key: true |
| date          | date    | null: false                    |

### Association
- has_many :items

## Analysesテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_id              | references | null: false, foreign_key: true |
| list_id              | references | null: false, foreign_key: true |
| dateTime             | time       | null: false                    |
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