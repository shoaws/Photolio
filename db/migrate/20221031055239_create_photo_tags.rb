class CreatePhotoTags < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_tags do |t|
      t.integer :photo_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
    #同じタグを保存できないように
    add_index :photo_tags, [:photo_id, :tag_id], unique: true
  end
end
