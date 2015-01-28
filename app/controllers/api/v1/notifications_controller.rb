class Api::V1::NotificationsController < Api::V1::BaseController

  def mark_all_read
    notifications = Notification.where(user_id: current_user.id, read: false)

    notifications.update_all(read: true)

    render json: notifications

  end
end
