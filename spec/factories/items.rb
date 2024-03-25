FactoryBot.define do
  factory :item do
    itemsName { Faker::Commerce.product_name }
    itemsFeature { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 1000..100000).to_i }
    status_id {  rand(1..Status.count) }
    delivery_charge_id {  rand(1..DeliveryCharge.count) }
    prefecture_id { rand(1..Prefecture.count) }
    schedule_id { rand(1..Schedule.count) }
    user { association :user }
    category_id { rand(1..Category.count) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    factory :price do
      value { 1000 }
    end

  end
end
