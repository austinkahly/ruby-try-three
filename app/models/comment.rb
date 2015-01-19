class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true, length: { minimum: 4}
  validates :article, presence: true
end