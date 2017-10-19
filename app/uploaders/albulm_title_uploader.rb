class AlbulmTitleUploader < BaseUploader
  include ActiveAdminJcrop::AssetEngine::CarrierWave

  version :thumb do
    process :active_admin_crop
    process resize_to_fill: [230, 230]
  end
end
