class Comment < ActiveRecord::Base
  has_many      :notifications,
                inverse_of: :comment

  belongs_to    :article, 
                inverse_of: :comments

  belongs_to    :user, 
                inverse_of: :comment

  validates     :user_id, :article, 
                presence: true

  validates     :body, 
                presence: true, 
                length: { minimum: 4}

  after_create :create_notification

  private

  def create_notification
    notification = Notification.create!(
      user_id: article.user_id,
      comment_id: self.id,
      read: false
    )
    UserMailer.comment_create(article.user).deliver
  end
end