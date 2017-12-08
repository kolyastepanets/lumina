class AddEnglishTitleToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :english_title, :string
  end
end
