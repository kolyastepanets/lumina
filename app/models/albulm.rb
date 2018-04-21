class Albulm < ApplicationRecord
  EN_SLUG_REGEX = /\A[A-Za-z\-\s]+\z/

  extend FriendlyId
  friendly_id :slug, use: :slugged
  mount_uploader :title_photo, AlbulmTitleUploader

  has_many :category_albulms, dependent: :destroy
  has_many :categories, -> { portfolio }, through: :category_albulms, source: :category
  has_many :images, -> { order(position: :asc) }, dependent: :destroy

  validates :slug, format: { with: EN_SLUG_REGEX }
  validates :slug, :title, :description, :title_photo, presence: true
end
