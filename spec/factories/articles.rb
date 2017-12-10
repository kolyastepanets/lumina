FactoryGirl.define do
  factory :article do
    title 'MyString'
    slug 'MyString'
    description 'MyString'
    main_image do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'images', "nature#{rand(11)}.jpg"), 'image/jpg'
      )
    end
    before(:create) do |article, _evaluator|
      article.categories << create_list(:category_for_blog, 2)
    end
  end
end
