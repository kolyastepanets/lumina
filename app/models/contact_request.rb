class ContactRequest < ApplicationRecord
  validates :email, :name, presence: true
end
