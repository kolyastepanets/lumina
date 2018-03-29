class LandingImageUploader < BaseUploader
  process resize_to_fit: [830, nil]

  version :small do
    process resize_to_fill: [200, 200]
  end
end
