class Ability
    include CanCan::Ability
    
  def initialize(user)
   user ||= User.new # guest user
   
    if user.role? :admin
      can :see_timestamps, User
      can :manage, :all
    elsif user.role? :secretary
      can [:read, :update], :all
    else # user.role? 
      can :see_timestamps, User, :id => user.id      
      can :read, [:home]
      can [:read,:update], User, :id => user.id
    end
  end

end
