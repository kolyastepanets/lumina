class RemoveCategoryIdFromAlbulm < ActiveRecord::Migration[5.1]
  def change
    remove_column :albulms, :category_id
  end
end
