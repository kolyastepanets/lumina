class CreateAlbulms < ActiveRecord::Migration[5.1]
  def change
    create_table :albulms do |t|
      t.string :title
      t.string :title_photo
      t.string :slug
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
