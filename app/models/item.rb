class Item < ApplicationRecord
	 attachment :item_image
	belongs_to :user
	belongs_to :category
end
