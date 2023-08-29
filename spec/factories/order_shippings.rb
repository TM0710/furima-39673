FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    region_id { 2 }
    city { Faker::Address.city }
    street { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
