class AdminAbility
  include CanCan::Ability
  def initialize(admin)
    if admin
      can :manage, :all
    else
      cannot :manage, :all
    end
  end
end
