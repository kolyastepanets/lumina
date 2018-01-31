class CreateStatisticLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :statistic_likes do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
