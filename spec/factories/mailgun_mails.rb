FactoryGirl.define do
  factory :mailgun_mail do
    subject 'MyString'
    body 'MyText'
    sent_to 'MyString'
  end
end
