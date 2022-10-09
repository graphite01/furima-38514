FactoryBot.define do
  factory :commodity_exhibition do
    item_name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.sentence }
    detail_category_id { Faker::Number.between(from: 2, to: 11) }
    detail_situation_id { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id { Faker::Number.between(from: 2, to: 4) }
    selling_price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |commodity_exhibition|
      commodity_exhibition.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
