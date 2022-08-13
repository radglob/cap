require 'faker'

FactoryBot.define do
  factory :address do
    user_id { 1 }
    address1 { "MyString" }
    address2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { "MyString" }
  end

  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.today }

    trait :with_basic_info do
      basic_info
    end
  end

  factory :basic_info, class: 'BasicInfo' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.between(from: '1980-1-1', to: '2000-1-1') }

    user
  end
end
