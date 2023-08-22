FactoryBot.define do
  factory :item do
    
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category { Category.where.not(id: 1).sample }
    condition { Condition.where.not(id: 1).sample }
    charge { Charge.where.not(id: 1).sample }
    region { Region.where.not(id: 1).sample }
    shipping_day { ShippingDay.where.not(id: 1).sample }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'test_image.png')
    end
  end
end
