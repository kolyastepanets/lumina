class Albulm < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  mount_uploader :title_photo, AlbulmTitleUploader

  belongs_to :category
  has_many :images
end
