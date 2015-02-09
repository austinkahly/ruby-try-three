class UserSerializer < BaseSerializer
  attributes :id, :email, :abilities, :can_create_article

  def abilities
    # TODO SOMEHOW THIS SHOULD BE A THING
  end

  def can_create_article
    can?(:create, Article)
  end
end
