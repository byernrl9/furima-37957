class ItemForm
  include ActiveModel::Model

  attr_accessor(
    :image,
    :name,
    :item_explanation,
    :category_id,
    :item_condition_id,
    :delivery_fee_id,
    :prefecture_id,
    :shipping_day_id,
    :price,
    :user_id,
    :id,
    :created_at,
    :datetime,
    :updated_at,
    :datetime,
    :tag_name
  )

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :item_explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :item_condition_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :delivery_fee_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :shipping_day_id, numericality: { other_than: 1, message: 'を選択してください' }

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  def save
    item = Item.create(image: image, name: name, item_explanation: item_explanation, category_id: category_id, item_condition_id: item_condition_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, shipping_day_id: shipping_day_id, price: price, user_id: user_id)
    
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params, item)
    item.item_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    tag.save if tag_name.present?
    item.update(params)
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end