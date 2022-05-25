<!-- Furima-37957 -->


<!-- users  table -->

|Column              |Type         |Options                   |
|--------------------|-------------|--------------------------|
|nickname            |string       |null: false               |
|email               |string       |null: false, unique: true |
|encrypted_password  |string       |null: false               |
|last_name           |string       |null: false               |
|first_name          |string       |null: false               |
|birth               |date         |null: false               |

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
|area_id             |integer      |null: false                      |
|days_id             |integer      |null: false                      |
|price               |integer      |null: false                      |
|user                |references   |null: false, foreign_key: true   |

- belongs_to :user
- has_one :purchase_record


<!-- purchase_records table -->

|Colum |Type        |Options                         |
|------|------------|--------------------------------|
|user  |references  |null: false, foreign_key: true  |
|item  |references  |null: false, foreign_key: true  |

- belongs_to :item
- has_one :shipping_address



<!-- shipping_address -->
|Column             |Type            |Options                  |
|-------------------|----------------|-------------------------|
|postal_code        |integer         |null: false              |
|area               |integer         |null: false              |
|municipality       |string          |null: false              |
|address            |string          |null: false              |
|building_name      |string          |                         |
|phone_num          |integer         |null: false              |

belongs_to :purchase_record


