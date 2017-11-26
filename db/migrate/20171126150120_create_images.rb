class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :albulm, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
