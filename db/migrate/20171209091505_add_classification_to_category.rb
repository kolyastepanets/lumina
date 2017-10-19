class AddClassificationToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :classification, :integer
  end
end
