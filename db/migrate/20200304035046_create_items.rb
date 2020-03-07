class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :categorie_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :item_image_id, null: false
      t.binary :item_sound_id, null: false
      t.binary :item_video_id, null: false
      t.text :description, null: false



      t.timestamps
    end
  end
end
