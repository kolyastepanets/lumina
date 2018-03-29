class CreateLandingImages < ActiveRecord::Migration[5.1]
  def change
    create_table :landing_images do |t|
      t.string :file

      t.timestamps
    end
  end
end
