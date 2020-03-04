class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.integer :user_id
      t.string :name, null: false
      t.string :item_image_id
      t.binary :item_sound_id
      t.binary :item_video_id
      t.text :description
      t.boolean :item_status



      t.timestamps
    end
  end
end
