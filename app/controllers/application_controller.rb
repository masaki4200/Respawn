class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :notification, if: :user_signed_in?

	def after_sign_in_path_for(resource)
		case resource
		when Admin
      admins_root_path
		when User
      users_user_path(current_user.id)
		end
	end

	def after_sign_up_path_for(resource)
    new_users_user_path(resource)
  end

	def after_sign_out_path_for(resource_or_scope)
  	if resource_or_scope == :admin
    	new_admin_session_path
  	else
    	root_path
  	end
  end

	def notification
    @notifications = current_user
    .passive_notifications.where.not(visitor_id: current_user)
    .page(params[:page]).per(30)
    @notifications.each do |notification|
    notification.update_attributes(checked: true)
    end
  end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
