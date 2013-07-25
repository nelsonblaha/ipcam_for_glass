class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :url
      t.string :name
      t.boolean :privacy
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
