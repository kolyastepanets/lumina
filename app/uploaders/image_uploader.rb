class ImageUploader < BaseUploader
  process resize_to_fill: [400, 400]
end
