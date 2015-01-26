class Notification < ActiveRecord::Base
  has_one       :article,
                inverse_of: :notification,
                through: :comment

  belongs_to    :comment,
                dependent: :destroy,
                inverse_of: :notifications
  
  belongs_to    :user,
                dependent: :destroy,
                inverse_of: :notifications

  validates     :user, :comment,
                presence: true
end
