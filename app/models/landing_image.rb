class LandingImage < ApplicationRecord
  mount_uploader :file, LandingImageUploader

  validates :file, presence: true
end
