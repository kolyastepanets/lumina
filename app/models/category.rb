class Category < ApplicationRecord
  TYPES = %w[blog portfolio].freeze
  extend FriendlyId
  friendly_id :slug, use: :slugged
  enum classification: TYPES

  has_many :category_albulms, dependent: :destroy
  has_many :albulms, through: :category_articles
  has_many :category_articles, dependent: :destroy
  has_many :articles, through: :category_articles

  validates :title, :classification, :slug, presence: true

  accepts_nested_attributes_for :category_articles
end
