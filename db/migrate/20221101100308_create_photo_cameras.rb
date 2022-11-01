class CreatePhotoCameras < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_cameras do |t|
      t.integer :photo_id, null: false
      t.integer :camera_id, null: false

      t.timestamps
    end
    add_index :photo_cameras, [:photo_id, :camera_id], unique: true
  end
end
