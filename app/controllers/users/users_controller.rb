class Users::UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @items = @user.items
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

  

  private
  def user_params
    params.require(:user).permit(:name,:user_image,:introduction)
  end



end
