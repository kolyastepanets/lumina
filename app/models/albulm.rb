class Albulm < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  mount_uploader :title_photo, AlbulmTitleUploader
  mount_uploaders :images, ImageUploader

  belongs_to :category
end
