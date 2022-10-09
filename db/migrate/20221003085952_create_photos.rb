class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.text :body, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :member_id, null: false


      t.timestamps
    end
  end
end
