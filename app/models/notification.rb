class Notification < ActiveRecord::Base
  belongs_to    :article,
                inverse_of: :notification

  belongs_to    :comment,
                inverse_of: :notifications
  
  belongs_to    :user,
                inverse_of: :notifications

  validates     :user, :comment,
                presence: true
end
