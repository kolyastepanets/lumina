class Albulm < ApplicationRecord
  EN_SLUG_REGEX = /\A[A-Za-z\-\s]+\z/

  extend FriendlyId
  friendly_id :slug, use: :slugged
  mount_uploader :title_photo, AlbulmTitleUploader

  belongs_to :category
  has_many :images

  validates :slug, format: { with: EN_SLUG_REGEX }
  validates :slug, :title, :description, :title_photo, presence: true
end
