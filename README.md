# README

## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| ID                 | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| In_charge1         | integer |                           |
| In_charge2         | integer |                           |
| In_charge3         | integer |                           |

### Association
- has_many :notifications

## itemsテーブル
| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| INcode        | integer | null: false, unique: true |
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
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_id        | references | null: false, foreign_key: true |
| DateTime       | time       | null: false                    |
| TankNo         | string     | null: false                    |
| Density        | float      | null: false                    |
| Alcohol        | float      | null: false                    |
| Extract        | float      | null: false                    |
| Acid_degree    | float      |                                |
| Amino_acid     | float      |                                |
| Color          | float      |                                |
| Turbidity      | float      |                                |
| Sulfurous_acid | float      |                                |
| Comment        | string     |                                |

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