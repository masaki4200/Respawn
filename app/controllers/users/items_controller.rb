class Users::ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
    @categories = Category.all
    if @item.user.id != current_user.id
      redirect_to items_path
    end
  end

  def new
  	@item = Item.new
  	@genres = Category.genre_statuses.keys
    @categories = Category.all
  end

  def create
  	@item = Item.new(item_params)
  	@item.user_id = current_user.id
  	if @item.save
  		redirect_to users_item_path(@item.id), notice: "successfully created アイテム!"
  	else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
           flash[:notice] = "You have updated user successfully"
           redirect_to users_item_path(@item.id)
    else
       render :edit
    end
  end


  private

  def item_params
  	params.require(:item).permit(:title, :item_image, :description, :genre_status, :category_id, :user_id, :item_image_id, :item_sound_id, :item_video_id )
  end

end