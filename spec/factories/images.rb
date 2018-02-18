FactoryGirl.define do
  factory :image do
    file do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'images', "nature#{rand(11)}.jpg"), 'image/jpg'
      )
    end

    association :albulm
  end
end
