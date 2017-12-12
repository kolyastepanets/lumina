class CreateCategoryArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :category_articles do |t|
      t.references :category, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
