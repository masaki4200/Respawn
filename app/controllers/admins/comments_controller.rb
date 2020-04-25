class Admins::CommentsController < ApplicationController

	def destroy
		@comment = Comment.find(params[:item_id])
    @item = @comment.item
      @comment.destroy
      @comments = @item.comments.page(params[:page]).per(10).order(created_at: :DESC)
  	 # redirect_to request.referer
	end
end

