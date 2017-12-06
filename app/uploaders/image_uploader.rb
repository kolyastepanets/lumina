class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fill: [230, 230]

  def extension_whitelist
    %w[jpeg png jpg]
  end
end
