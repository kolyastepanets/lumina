class Article < ApplicationRecord
  extend FriendlyId
  include PgSearch

  pg_search_scope :search_in_articles, against: %i[title description]
  friendly_id :slug, use: :slugged
  mount_uploader :main_image, ArticleMainImageUploader

  has_many :category_articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, -> { blog }, through: :category_articles, source: :category

  validates :title, :slug, :main_image, :description, :preview_description, presence: true

  scope :by_category, lambda { |category_id|
    joins(:categories).where(category_articles: { category_id: category_id })
                      .references(:categories)
  }
end
