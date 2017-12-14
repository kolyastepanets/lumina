class CreateSubscriberMailgunMails < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriber_mailgun_mails do |t|
      t.references :subscriber, foreign_key: true
      t.references :mailgun_mail, foreign_key: true

      t.timestamps
    end
  end
end
