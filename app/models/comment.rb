class Comment < ActiveRecord::Base
  has_many      :notifications

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
    article = Article.find_by(self.article_id)
    user = User.find_by(@article.user_id).id
      Notification.create(
        article_id: self.article_id,
        user_id: @user,
        comment_id: self.id,
        read: false
        )
    user = User.find(@article.user_id)
    UserMailer.comment_create(user).deliver
    end
end