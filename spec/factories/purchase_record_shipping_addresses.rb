FactoryBot.define do
  factory :purchase_record_shipping_address do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '大阪府' }
    address { '1-1' }
    building_name { '大阪メゾン' }
    phone_num { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
