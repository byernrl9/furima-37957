<!-- Furima-37957 -->


<!-- user  table -->

|Column              |Type         |Options                   |
|--------------------|-------------|--------------------------|
|Nickname            |string       |null: false               |
|Email               |string       |null: false, unique: true |
|Password            |string       |null: false               |
|encrypted_password  |string       |null: false               |
|last_name           |string       |null: false               |
|first_name          |string       |null: false               |
|birth               |string       |null: false               |

- has_many :items
- has_many :shipping_addresses
- has_many :purchase_records


<!-- items table  -->
|Column              |Type         |Options                          |
|--------------------|-------------|---------------------------------|
|image               |             |null: false                      |
|name                |string       |null: false                      |
|item_explanation    |text         |null: false                      |
|category            |string       |null: false                      |
|item_condition      |string       |null: false                      |
|delivery_fee        |string       |null: false                      |
|area                |string       |null: false                      |
|days                |string       |null: false                      |
|price               |string       |null: false                      |
|user                |references   |null: false, foreign_key: true   |

- belongs_to :user
- has_one :purchase_record


<!-- purchase_record table -->

|Colum |Type        |Options                         |
|------|------------|--------------------------------|
|user  |references  |null: false, foreign_key: true  |
|item  |references  |null: false, foreign_key: true  |

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address



<!-- shipping_address -->
|Column             |Type            |Options                  |
|-------------------|----------------|-------------------------|
|postal_code        |string          |null: false              |
|prefecture         |string          |null: false              |
|municipality       |string          |null: false              |
|address            |string          |null: false              |
|building_name      |string          |null: false              |
|phone_num          |string          |null: false              |

belongs_to :user
has_one    :purchase_record


