class Item < ApplicationRecord
	 attachment :item_image
	belongs_to :user
	belongs_to :category

	has_many :item_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
end
