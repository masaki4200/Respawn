class Admins::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.page(params[:page]).per(10).order(created_at: :DESC)
  end

  def destroy
  	@item = Item.find(params[:id])
  	@item.destroy
    redirect_to admins_items_path
  end

end


