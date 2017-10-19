FactoryGirl.define do
  factory :article do
    title { Faker::Bank.name }
    slug { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    preview_description { Faker::Lorem.paragraph }
    main_image do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'images', "nature#{rand(11)}.jpg"), 'image/jpg'
      )
    end
    small_main_image do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'images', "nature#{rand(11)}.jpg"), 'image/jpg'
      )
    end

    trait :with_categories do
      before(:create) do |article, _evaluator|
        article.categories << create_list(:category_for_blog, 2)
      end
    end
  end
end
