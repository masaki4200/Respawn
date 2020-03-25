class RenameItemCommentsToComments < ActiveRecord::Migration[5.2]
  def change
  	rename_table :item_comments, :comments
  end
end
