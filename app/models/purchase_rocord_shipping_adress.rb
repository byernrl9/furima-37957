class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :city, :address, :building_name, :phone_num, :purchase_rocords_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :purchase_records_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A0[5789]0\d{4}\d{4}\z/ }
  end
  validates :prefecture, numericality: {only_integer integer: true, other_than: 1, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_num: phone_num, purchase_records_id: purchase_records.id)
  end

  end