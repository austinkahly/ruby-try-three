class UserSerializer < BaseSerializer
  attributes :id, :email, :abilities, :can_create_article, :can_create_comment

  def abilities
    # TODO SOMEHOW THIS SHOULD BE A THING
  end

  def can_create_article
    can?(:create, Article)
  end

  def can_create_comment
    can?(:create, Comment)
  end
end
