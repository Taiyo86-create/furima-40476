# spec/factories/items.rb

FactoryBot.define do
  factory :item do
    itemsName { Faker::Commerce.product_name }
    itemsFeature { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 1000..100000) }
    status { Status.all.sample }
    delivery_charge { DeliveryCharge.all.sample }
    prefecture { Prefecture.all.sample }
    schedule { Schedule.all.sample }
    user { association :user }
  end
end
