class AlbulmTitleUploader < BaseUploader
  include ActiveAdminJcrop::AssetEngine::CarrierWave

  process resize_to_fit: [500, 500]
  process :active_admin_crop
end
