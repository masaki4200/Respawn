class Users::NotificationsController < ApplicationController
    before_action :authenticate_user!

	def index
    	@notifications = current_user.passive_notifications.page(params[:page]).per(15)
    	@notifications.each do |notification|
        end
    end

    def destroy
    	     # binding.pry
    	@notification = Notification.find(params[:id])
    	@notification.destroy
    	redirect_to request.referrer
    end
end
