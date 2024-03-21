FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    firstname_kana { Faker::Name.first_name }
    lastname_kana { Faker::Name.last_name }
    birth { Faker::Date.birthday }
  end
end
