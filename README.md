<!-- Furima-37957 -->


<!-- users  table -->

|Column              |Type         |Options                   |
|--------------------|-------------|--------------------------|
|nickname            |string       |null: false               |
|email               |string       |null: false, unique: true |
|encrypted_password  |string       |null: false               |
|family_name         |string       |null: false               |
|first_name          |string       |null: false               |
|family_name_kana    |string       |null: false               |
|first_name_kana     |string       |null: false               |
|birth_day           |date         |null: false               |

- has_many :items
- has_many :purchase_records


<!-- items table  -->
|Column              |Type         |Options                          |
|--------------------|-------------|---------------------------------|
|name                |string       |null: false                      |
|item_explanation    |text         |null: false                      |
|category_id         |integer      |null: false                      |
|item_condition_id   |integer      |null: false                      |
|delivery_fee_id     |integer      |null: false                      |
|prefecture_id       |integer       |null: false                     |
|shipping_day_id     |integer      |null: false                      |
|price               |integer      |null: false                      |
|user                |references   |null: false, foreign_key: true   |

- belongs_to :user
- has_one :purchase_record


<!-- purchase_records table -->

|Colum             |Type        |Options                         |
|------------------|------------|--------------------------------|
|user              |references  |null: false, foreign_key: true  |
|item              |references  |null: false, foreign_key: true  |


- belongs_to :item
- belongs_to :user
- has_one :shipping_address



<!-- shipping_address -->
|Column             |Type            |Options                         |
|-------------------|----------------|--------------------------------|
|post_code          |string          |null: false                     |
|prefecture_id      |integer         |null: false                     |
|city               |string          |null: false                     |
|address            |string          |null: false                     |
|building_name      |string          |                                |
|phone_num          |string          |null: false                     |
|purchase_records   |references      |null: false, foreign_key: true  |

belongs_to :purchase_record


