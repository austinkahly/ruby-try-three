class NotificationsController < ApplicationController
  def index
  end

  def delete
    notification = Notification.find(params[:id])
    notification.destroy
  end
end
