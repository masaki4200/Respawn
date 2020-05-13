class User < ApplicationRecord

  validates :name, presence: true
  validates :name, length: {in: 2..20}
  validates :introduction, length: {maximum: 150}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :user_image


  # ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================


  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================


  # ===============================通知機能====================================================================
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  # ==========================================================================================================

  before_create :set_default_image

  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end

    # フォローの通知メソッド
    # 「連続でフォローボタンを押す」ことに備えて、同じ通知レコードが存在しないときだけ、レコードを作成する
  def create_notification_follow!(current_user)
  temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
  if temp.blank?
    notification = current_user.active_notifications.new(
      visited_id: id,
      action: 'follow'
    )
    notification.save if notification.valid?
    end
  end

  def set_default_image
    self.default_image = "event_easter_#{rand(5)}.png"
    color_hash = {
      0 => '#ffd6ff',
      1 => '#d6d6ff',
      2 => '#d6ffff',
      3 => '#d6ffd6',
      4 => '#ffffcc',
      5 => '#00bfff',
      6 => '#cd5c5c',
      7 => '#ffd700',
    }
    self.default_backgroud_color = color_hash[rand(7)]
  end
end
