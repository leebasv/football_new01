class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:create, :destroy, :update], ScoreBet, user_id: user.id
      can [:create, :destroy, :update], Comment, user_id: user.id
      can [:create, :update, :destroy], User, id: user.id
    end
  end
end
