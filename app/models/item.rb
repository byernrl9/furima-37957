class Item < ApplicationRecord
  validates :name, presence: true
  validates :item_explanation, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true

  with_options presence: true, format: { :with /\A[0-9]+\z/ } do
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} }
  end

  belongs_to :user
  has_one_attached :image
  # has_one :purchase_records


end 
