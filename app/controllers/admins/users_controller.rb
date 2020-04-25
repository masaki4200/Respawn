class Admins::UsersController < ApplicationController
  def index
  	@users = User.all
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


