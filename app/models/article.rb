class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  mount_uploader :main_image, ArticleMainImageUploader

  has_many :category_articles, dependent: :destroy
  has_many :categories, -> { blog }, through: :category_articles, source: :category

  scope :by_category, lambda { |category_id|
    joins(:categories).where(category_articles: { category_id: category_id })
                      .references(:categories)
  }
end
