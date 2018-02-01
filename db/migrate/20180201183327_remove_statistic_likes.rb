class RemoveStatisticLikes < ActiveRecord::Migration[5.1]
  def change
    drop_table :statistic_likes do |t|
      t.integer :quantity, null: false
      t.timestamps null: false
    end
  end
end
