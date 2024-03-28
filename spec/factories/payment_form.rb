FactoryBot.define do
  factory :payment_form do
    post_code { Faker::Address.postcode }
    prefecture_id { rand(2..Prefecture.count) }
    client_city { Faker::Address.city }
    client_local { Faker::Address.street_name }
    client_building { Faker::Address.street_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
