class Users::ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

  def show
  	@user = User.find (params[:id])
  	@item = Item.find (params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
    if @item.user.id != current_user.id
      redirect_to items_path
    end
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	@item.user_id = current_user.id
  	if @item.save
  		redirect_to users_item_path(@item.id), notice: "successfully created アイテム!"
  	end
  end


  private

  def item_params
  	params.require(:item).permit(:title, :item_image, :description)
  end

end

