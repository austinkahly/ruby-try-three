class Article < ActiveRecord::Base
  has_many    :comments, 
              dependent: :destroy, 
              inverse_of: :article

  has_many    :notifications
  
  belongs_to  :user, 
              inverse_of: :articles

  validates   :user_id, :text, 
              presence: true

  validates   :title, 
              presence: true,
              length: { minimum: 5 }
end
