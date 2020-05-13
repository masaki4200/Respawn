class Users::UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(12)
    @items_count = @items.count
  end

  def edit
    @user = User.find(params[:id])
    if @user.id !=current_user.id
      redirect_to users_user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update (user_params)
      redirect_to users_user_path(@user.id), notice: "successfully updated user!"
    else
      render :edit
    end
  end

  def withdraw
  	@user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  def favorites
    @user = User.find(params[:user_id])
    @favorite_item_ids = @user.favorites.pluck(:item_id)
    @favorite_items = Item.where(id: @favorite_item_ids).page(params[:page]).per(16)
  end

  private
  def user_params
    params.require(:user).permit(:name,:user_image,:introduction)
  end
end
