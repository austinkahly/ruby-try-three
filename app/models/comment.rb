class Comment < ActiveRecord::Base
  has_many      :notifications,
                dependent: :destroy,
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
    if (article.user_id != user_id)
      notification = Notification.create!(
        user_id: article.user_id,
        comment_id: id,
        read: false
      )
      UserMailer.delay.comment_create(article.user_id)
    end
  end
end