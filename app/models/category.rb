class Category < ApplicationRecord
	has_many :items, dependent: :destroy
		enum genre_status:{image:0,sound:1,movie:2}
end
