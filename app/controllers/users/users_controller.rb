class Users::UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end



  def edit

  end

  def withdraw
  	
  end

end
