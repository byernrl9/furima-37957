class UserInfo < ApplicationRecord
  validates :birth_day, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字、ひらがな、カタカナ）を使用してください' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角（カタカナ）を使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  belongs_to :user, optional: true
end
