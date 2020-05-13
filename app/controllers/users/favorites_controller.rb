class Users::FavoritesController < ApplicationController
	  before_action :authenticate_user!

  def create
  	@item = Item.find(params[:item_id])
    favorite = current_user.favorites.new(item_id: @item.id)
    favorite.save
    @item.create_notification_favorite!(current_user)

  end
  def destroy
  	@item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: @item.id)
    favorite.destroy
  end

  def index
    @myItem = Item.find(params[:item_id])
    @items = Favorite.find_by(user_id: @myItem.user_id, item_id: params[:item_id])
    puts @items.to_json
  end
end
