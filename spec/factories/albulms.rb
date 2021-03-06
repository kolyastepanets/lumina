FactoryGirl.define do
  factory :albulm do
    title { Faker::Lorem.word }
    slug { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    title_photo do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'images', "nature#{rand(11)}.jpg"), 'image/jpg'
      )
    end
    association :category, factory: :category_for_portfolio

    trait :with_images do
      after(:create) do |instance|
        create_list :image, 5, albulm: instance
      end
    end
  end
end
