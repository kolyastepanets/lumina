FactoryGirl.define do
  factory :admin do
    email { Faker::Internet.email }
    password 'Testing1'
  end
end
