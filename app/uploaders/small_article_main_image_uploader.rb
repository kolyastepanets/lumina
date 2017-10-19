class SmallArticleMainImageUploader < BaseUploader
  include ActiveAdminJcrop::AssetEngine::CarrierWave

  version :thumb do
    process :active_admin_crop
    process resize_to_fill: [320, 260]
  end
end
