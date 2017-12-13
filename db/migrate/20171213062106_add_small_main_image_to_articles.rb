class AddSmallMainImageToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :small_main_image, :string
  end
end
