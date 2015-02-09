class UserSerializer < BaseSerializer
  attributes :id, :email, :can_create_article, :can_create_comment

  def can_create_article
    can?(:create, Article)
  end

  def can_create_comment
    can?(:create, Comment)
  end
end
