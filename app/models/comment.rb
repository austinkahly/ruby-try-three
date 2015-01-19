class Comment < ActiveRecord::Base
  belongs_to :article, inverse_of: :comment
  belongs_to :user, inverse_of: :comments
  validates :user_id, :article, presence: true
  validates :body, presence: true, length: { minimum: 4}
end