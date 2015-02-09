class ArticleSerializer < BaseSerializer
  attributes :id, :title, :text, :can_edit, :can_destroy

  has_many :comments

  def can_edit
    can?(:update, object)
  end

  def can_destroy
    can?(:destroy, object)
  end
end
