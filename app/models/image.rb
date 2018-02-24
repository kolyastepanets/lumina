class Image < ApplicationRecord
  mount_uploader :file, ImageUploader

  belongs_to :albulm

  acts_as_list scope: :albulm

  validates :file, presence: true
end
