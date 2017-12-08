class Category < ApplicationRecord
  has_many :albulms

  validates :title, presence: true
end
