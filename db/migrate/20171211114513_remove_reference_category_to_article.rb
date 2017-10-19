class RemoveReferenceCategoryToArticle < ActiveRecord::Migration[5.1]
  def change
    remove_reference :articles, :category, index: true
  end
end
