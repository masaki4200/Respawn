class AddDefaultImageToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :default_image, :string
  	add_column :users, :default_backgroud_color, :string
  end
end
