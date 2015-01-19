class Role < ActiveRecord::Base
  ADMIN = "admin"
  REGISTERED = "registered"
  has_many :users, inverse_of: :role
end
