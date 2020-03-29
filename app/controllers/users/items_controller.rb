class Users::ItemsController < ApplicationController

  def index


  	if params[:category_id] != nil
    @items = Item.where(category_id: params[:category_id]).page(params[:page]).per(16)
    @items_count = @items.count
    @categories = Category.where(category_status: true)
    @category = Category.find(params[:category_id])

    elsif params[:place] && params[:place] == 'top'
      @items = Item.joins(:favorites).group(:id).order('count(item_id) desc').limit(5)
      @items_count = 5
      @categories = Category.where(category_status: true)
      @category = Category.all
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
    @comment = Comment.new
    @comments = @item.comments.page(params[:page])
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