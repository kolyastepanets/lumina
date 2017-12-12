FactoryGirl.define do
  factory :comment do
    name 'MyString'
    email 'MyString'
    body 'MyString'
    association :article
  end
end
