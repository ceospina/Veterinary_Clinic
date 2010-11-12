class Ability
    include CanCan::Ability
    
  def initialize(user)
   user ||= User.new # guest user
    if user.role? :admin
      can :manage, :all
    elsif user.role? :secretary
      can [:read, :update], :all
    else
      can :read, [:home]
    end
  end

end
