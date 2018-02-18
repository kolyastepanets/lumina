class ArticleMainImageUploader < BaseUploader
  include ActiveAdminJcrop::AssetEngine::CarrierWave

  process resize_to_fit: [900, 900]

  version :thumb do
    process :active_admin_crop
    process resize_to_fill: [650, 900]
  end
end
