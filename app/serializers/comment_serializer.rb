class CommentSerializer < BaseSerializer
  attributes :id, :user_id, :article_id, :body, :can_edit, :can_destroy

  def can_edit
    can?(:update, object)
  end

  def can_destroy
    can?(:destroy, object)
  end

end
