class Users::RelationshipsController < ApplicationController
  before_action :authenticate_user!

	def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user.create_notification_follow!(current_user)
    redirect_to request.referer
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to request.referer
  end

  def follower
    @myUser = User.find(params[:user_id])
    @users = @myUser.followings
  end

  def followed
    @myUser = User.find(params[:user_id])
    @users = @myUser.followers
  end

end

