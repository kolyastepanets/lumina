class ArticleMainImageUploader < BaseUploader
  process resize_to_fit: [900, 900]

  version :small_preview do
    process resize_to_fill: [320, 260]
  end

  version :big_preview do
    process resize_to_fill: [650, 900]
  end
end
