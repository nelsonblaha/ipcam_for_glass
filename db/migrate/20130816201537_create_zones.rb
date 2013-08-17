class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.integer :user_id
      t.integer :camera_id
      t.float :latitude
      t.float :longitude
      t.float :radius
      t.boolean :triggered

      t.timestamps
    end
  end
end
