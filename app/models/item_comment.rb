class ItemComment < ApplicationRecord
	belongs_to :user
  belongs_to :item

  # バリデーション
  validates :comment, presence: true

  # 通知機能
  has_many :notifications
end
