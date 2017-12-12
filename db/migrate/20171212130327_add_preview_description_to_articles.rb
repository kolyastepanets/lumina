class AddPreviewDescriptionToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :preview_description, :text
  end
end
