class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: {maximum: 200}

	attachment :item_image
	belongs_to :user
	belongs_to :category

	# 通知機能
	has_many :notifications, dependent: :destroy

	# コメント機能
	has_many :comments, dependent: :destroy

	# いいね機能
  has_many :favorites, dependent: :destroy

  # 画像認証
  # has_many :tags, dependent: :destroy

  # いいね判別メソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

    	# いいね通知メソッド
	def create_notification_favorite!(current_user)
		# いいねを連続でした場合でも、1度しか相手に通知がいかないようにする
		temp = Notification.where(["visitor_id = ? and visited_id = ? and item_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
		if temp.blank?
			notification = current_user.active_notifications.new(
				item_id: id,
				visited_id: user_id,
				action: 'favorite'
			)
			# 自分自身のいいねの場合は通知済みにする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
		end
		notification.save if notification.valid?
  	end
  end

	# コメント通知メソッド
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、投稿者に通知を送る
    temp_ids = Comment.select(:user_id).where(item_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
    save_notification_comment!(current_user, comment_id, user_id)
  end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      item_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
