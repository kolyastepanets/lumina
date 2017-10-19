class MailgunMail < ApplicationRecord
  TYPES = %w[received sent].freeze
  enum classification: TYPES
  attr_accessor :multiple_emails

  has_many :subscriber_mailgun_mails, dependent: :destroy
  has_many :subscribers, through: :subscriber_mailgun_mails

  validates :subject, :body, presence: true
end
