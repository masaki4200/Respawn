class Users::ItemCommentsController < ApplicationController
	def create
		@item = Item.find(params[:item_id])
        @item_new = Item.new
        @item_comment = @item.item_comments.new(item_comment_params)
        @item_comment.user_id = current_user.id
        @item_comment.save
        # 通知
        @item.create_notification_comment!(current_user, @item_comment.id)
	end

	def destroy
		@item_comment = ItemComment.find(params[:item_id])
        @item = @item_comment.item
    if @item_comment.user == current_user
      @item_comment.destroy
  	else
  	redirect_to request.referer
    end
	end

private
	def item_comment_params
	    params.require(:item_comment).permit(:comment)
	end
end
