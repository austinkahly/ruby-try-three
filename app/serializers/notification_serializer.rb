class NotificationSerializer < BaseSerializer
  attributes :id, :display_text, :article_id

  def display_text
    "#{object.comment.user.email} commented on #{object.article.title}."
  end

  def article_id
    object.comment.article_id
  end
end
