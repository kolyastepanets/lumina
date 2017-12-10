class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  mount_uploader :main_image, ArticleMainImageUploader

  has_many :category_articles, dependent: :destroy
  has_many :categories, -> { blog }, through: :category_articles, source: :category
end
