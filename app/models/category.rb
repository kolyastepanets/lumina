class Category < ApplicationRecord
  TYPES = %w[blog portfolio].freeze
  enum classification: TYPES

  has_many :albulms
  has_many :category_articles
  has_many :articles, through: :category_articles

  validates :title, :classification, presence: true
end
