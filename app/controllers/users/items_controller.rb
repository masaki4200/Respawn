class Users::ItemsController < ApplicationController

  def index
  	if params[:category_id] != nil
    @items = Item.where(category_id: params[:category_id]).page(params[:page])
    @items_count = @items.count
    @categories = Category.where(category_status: true)
    @category = Category.find(params[:category_id])
    else
    @items = Item.all.page(params[:page])
    @items_all = Item.all
    @items_count = @items_all.count
    @categories = Category.where(category_status: true)
    @category = Category.all
    end
  end

  def show
  	@item = Item.find(params[:id])
    @item_comment = ItemComment.new
    @item_comments = @item.item_comments
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to users_user_path(current_user)
  end

  private

  def item_params
  	params.require(:item).permit(:title, :item_image, :description, :genre_status, :category_id, :user_id, :item_image_id, :item_sound_id, :item_video_id )
  end

end