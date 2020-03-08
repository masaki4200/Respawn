class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
    	t.string :name, null: false
    	t.boolean :categorie_status
    	t.integer :genre_status,default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
