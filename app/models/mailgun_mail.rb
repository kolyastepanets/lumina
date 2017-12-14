class MailgunMail < ApplicationRecord
  TYPES = %w[received sent].freeze
  enum classification: TYPES
end
