class CreateMailgunMails < ActiveRecord::Migration[5.1]
  def change
    create_table :mailgun_mails do |t|
      t.string :subject
      t.text :body
      t.string :sent_to
      t.integer :classification

      t.timestamps
    end
  end
end
