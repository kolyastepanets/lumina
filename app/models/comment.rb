class Comment < ApplicationRecord
  belongs_to :article

  validates :email, :name, presence: true
end
