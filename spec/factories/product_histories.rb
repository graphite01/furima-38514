FactoryBot.define do
  factory :product_history do
    post_code { '000-0000' }
    municipalities { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
