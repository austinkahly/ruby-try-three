class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy, inverse_of: :article
  belongs_to :user, inverse_of: :article
  validates :user_id, presence: true
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true
end
