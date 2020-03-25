class Users::CommentsController < ApplicationController
		def create
		@item = Item.find(params[:item_id])
        # @item_new = Item.new
        @comment = @item.comments.new(comment_params)
        @comment.user_id = current_user.id

      if @comment.save
        # 通知
         @item.create_notification_comment!(current_user, @comment.id)
      end
       @comments = @item.comments.reverse
	end

	def destroy
		@comment = Comment.find(params[:item_id])
    @item = @comment.item
    if @comment.user == current_user
      @comment.destroy
      @comments = @item.comments.reverse
  	else
  		# redirectするのは変だから直す
  	 redirect_to request.referer
    end
    @comments = @item.comments.reverse
	end

private
	def comment_params
	    params.require(:comment).permit(:item_id, :user_id, :comment)
	end
end

