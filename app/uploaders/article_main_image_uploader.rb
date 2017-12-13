class ArticleMainImageUploader < BaseUploader
  include ActiveAdminJcrop::AssetEngine::CarrierWave

  process resize_to_fit: [900, 900]
  process :active_admin_crop
end
