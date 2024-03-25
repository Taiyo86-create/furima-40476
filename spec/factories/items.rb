FactoryBot.define do
  factory :item do
    itemsName { Faker::Commerce.product_name }
    itemsFeature { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 1000..100000).to_i }
    status_id { Status.all.sample }
    delivery_charge_id { DeliveryCharge.all.sample }
    prefecture_id { Prefecture.all.sample }
    schedule_id { Schedule.all.sample }
    user { association :user }
    category_id { Category.all.sample}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    factory :price do
      value { 1000 }
    end

  end
end
