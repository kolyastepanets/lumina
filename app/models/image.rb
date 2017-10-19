class Image < ApplicationRecord
  mount_uploader :file, ImageUploader

  belongs_to :albulm

  validates :file, presence: true
end
