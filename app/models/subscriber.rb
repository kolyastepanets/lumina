class Subscriber < ApplicationRecord
  has_many :subscriber_mailgun_mails, dependent: :destroy
  has_many :mails, through: :subscriber_mailgun_mails, source: :mailgun_mail

  scope :active, -> { where(active: true) }
end
