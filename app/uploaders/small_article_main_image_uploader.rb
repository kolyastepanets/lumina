class SmallArticleMainImageUploader < BaseUploader
  include ActiveAdminJcrop::AssetEngine::CarrierWave

  process resize_to_fit: [800, 800]

  version :thumb do
    process :active_admin_crop
    process resize_to_fill: [320, 260]
  end
end
