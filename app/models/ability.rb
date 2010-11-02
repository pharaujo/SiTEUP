class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    # An admin may manage all and everything
    if user.role? :admin 
      can :manage, :all
    end

    # A reporter may manage news items and pages
    if user.role? :reporter
      can :manage, [Post, Page]
    end

    # A humanrelations may manage members, entities and something else not implemented
    if user.role? :humanrelations
      can :manage, [Entity, Member, Promotion, Role]
    end

    # A member may manage his own profile to a certain extent
    can :update, Member do |member|
      member.user == user
    end

    # Guest users may read everything, for now
    can :read, :all
  end
end
