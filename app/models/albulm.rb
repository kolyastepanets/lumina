class Albulm < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  belongs_to :category
  has_many :images

  accepts_nested_attributes_for :images
end
