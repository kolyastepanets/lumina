FactoryGirl.define do
  factory :subscriber do
    name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    active true
  end
end
