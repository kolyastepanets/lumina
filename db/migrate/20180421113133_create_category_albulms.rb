class CreateCategoryAlbulms < ActiveRecord::Migration[5.1]
  def change
    create_table :category_albulms do |t|
      t.integer :category_id
      t.integer :albulm_id

      t.timestamps
    end
    add_index :category_albulms, :category_id
    add_index :category_albulms, :albulm_id
  end
end
