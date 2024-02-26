## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| dogname            | string     | null: false                    | 
| dogtype            | string     | null: false                    |
| birth_date         | date       | null: false                    |

### Association

## dogcafesテーブル
| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| cafe_name                   | string     |                                |
| cafe_discription            | text       |                                |
| cafe_postal_code            | string     |                                |
| cafe_region                 | string     |                                | 
| cafe_locality               | string     |                                |
| cafe_street_address         | string     |                                |
| cafe_latitude               | float      |                                |
| cafe_longitude              | float      |                                |

### Association

## dogrunsテーブル
| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| run_name                   | string     |                                |
| run_discription            | text       |                                |
| run_postal_code            | string     |                                |
| run_region                 | string     |                                | 
| run_locality               | string     |                                |
| run_street_address         | string     |                                |
| run_latitude               | float      |                                |
| run_longitude              | float      |                                |

### Association