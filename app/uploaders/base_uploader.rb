class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w[jpeg png jpg]
  end
end
