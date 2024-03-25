FactoryBot.define do
  factory :item do
    itemsName { Faker::Commerce.product_name }
    itemsFeature { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 1000..100000).to_i }
    status { Status.all.sample }
    delivery_charge { DeliveryCharge.all.sample }
    prefecture { Prefecture.all.sample }
    schedule { Schedule.all.sample }
    user { association :user }
    category { Category.all.sample}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    factory :price do
      value { 1000 }
    end

  end
end
