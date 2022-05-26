FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { 'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"田中"}
    first_name            {"太郎"}
    family_name_kana      {"タナカ"}
    first_name_kana       {"タロウ"}
    birth_day             {"1997-12-12"}
  end
end