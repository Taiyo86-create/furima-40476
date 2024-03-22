require 'gimei'

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a'+Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    firstname { Gimei.first.kanji }
    lastname { Gimei.last.kanji }
    firstname_kana { Gimei.first.katakana }
    lastname_kana { Gimei.last.katakana }
    birth { Faker::Date.birthday }
  end
end
