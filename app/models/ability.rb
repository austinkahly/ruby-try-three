class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, Article
    else
      can :read, :all
    end
  end
end
