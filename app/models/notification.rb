class Notification < ActiveRecord::Base
  has_one       :article,
                inverse_of: :notifications,
                through: :comment

  belongs_to    :comment,
                inverse_of: :notifications
  
  belongs_to    :user,
                inverse_of: :notifications

  validates     :user, :comment,
                presence: true
end
