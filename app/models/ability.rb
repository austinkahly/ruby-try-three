class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, Article, user_id: user.id
      can :manage, Comment
    else
      can :read, :all
      can :destroy, Comment, user_id: user.id
    end
  end
end
