class Comment < ActiveRecord::Base
  belongs_to :article, inverse_of: :comments
  belongs_to :user, inverse_of: :comment
  validates :user_id, :article, presence: true
  validates :body, presence: true, length: { minimum: 4}
end