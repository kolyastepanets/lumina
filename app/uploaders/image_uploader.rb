class ImageUploader < BaseUploader
  process resize_to_fill: [500, 500]
end
