class Admins::ItemsController < ApplicationController

  def index
    if params[:today] && params[:today] == 'today'
       @items = Item.where(created_at: Date.current.all_day)
       .order("created_at")
    else
  	   @items = Item.all
    end
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


