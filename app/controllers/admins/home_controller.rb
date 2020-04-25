class Admins::HomeController < ApplicationController
  def top
  	@users_count = User.where(created_at: Date.current.all_day)
  		.order("created_at")
  		.count

  	@items_count = Item.where(created_at: Date.current.all_day)
  		.order("created_at")
  		.count
  end
end
