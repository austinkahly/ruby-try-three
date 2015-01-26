class Notification < ActiveRecord::Base
  belongs_to :article
  belongs_to :comment
  belongs_to :user
end
