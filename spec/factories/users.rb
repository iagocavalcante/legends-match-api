FactoryBot.define do
  factory :user do
    uid { Faker::Internet.uuid }
    provider { Faker::Internet.free_email }
    password { Faker::Internet.password }
    email { Faker::Internet.free_email }
    full_name { Faker::Name.name }
    nickname { Faker::Name.first_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    bio { Faker::Lorem.sentences(number: 1) }
  end
end
