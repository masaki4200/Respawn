class Users::HomeController < ApplicationController
  def top
  	@items = Item.order("RANDOM()").all
  	
  	# @items = Item.order("RAND()").all ※ mysql時はこちらを使用する
  end
end
