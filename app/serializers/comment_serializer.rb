class CommentSerializer < BaseSerializer
  attributes :id, :body, :can_edit, :can_destroy

  def can_edit
    can?(:update, object)
  end

  def can_destroy
    can?(:destroy, object)
  end

end
