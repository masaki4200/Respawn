module Users::NotificationsHelper
  def unchecked_notifications
  	return [] unless user_signed_in?

    current_user.passive_notifications.where(checked: false)
  end
end
