class Admins::UsersController < ApplicationController

  def index
    if params[:today] && params[:today] == 'today'
       @users = User.where(created_at: Date.current.all_day)
       .order("created_at")
    else
  	@users = User.all
    end
  end

  def show
  	@user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(12)
    @items_count = @items.count
  end

  def edit
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    redirect_to admins_users_path
  end
end


