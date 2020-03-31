class Users::HomeController < ApplicationController
  def top
  	 @items = Item.order("RANDOM()").all
  	 
  	# ※ mysql時はこちらを使用する
  	# @items = Item.order("RAND()").all
  end
end
