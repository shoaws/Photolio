FactoryBot.define do
  factory :member do
    last_name { Faker::Lorem.characters(number:3) }
    first_name { Faker::Lorem.characters(number:3) }
    nickname { Faker::Lorem.characters(number:5) }
    email { Faker::Internet.free_email }
    introduction { Faker::Lorem.characters(number:10)}
    phone_number { Faker::Lorem.characters(number:11) }
    password { 'testtest' }
    password_confirmation { password }
  end
end