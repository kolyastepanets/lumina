class ImageUploader < BaseUploader
  include ActiveAdminJcrop::AssetEngine::CarrierWave

  process resize_to_fit: [800, 800]

  version :thumb do
    process :active_admin_crop
    process resize_to_fill: [500, 500]
  end

  version :small do
    process resize_to_fit: [200, 200]
  end
end
