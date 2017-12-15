class SubscriberMailgunMail < ApplicationRecord
  belongs_to :subscriber
  belongs_to :mailgun_mail
end
