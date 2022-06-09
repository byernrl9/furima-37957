class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end

100.30
10_030 * 10 ^ -2
