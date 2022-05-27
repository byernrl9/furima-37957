class Item < ApplicationRecord
  validates :name, presence: true
  validates :item_explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day


  # has_one :purchase_records
  
end
