class Notification < ActiveRecord::Base
  belongs_to    :article,
                inverse_of: :notification

  belongs_to    :comment,
                dependent: :destroy,
                inverse_of: :notifications
  
  belongs_to    :user,
                dependent: :destroy,
                inverse_of: :notifications

  validates     :user, :comment,
                presence: true
end
