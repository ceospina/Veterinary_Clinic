class Ability
    include CanCan::Ability
    
  def initialize(user)
   user ||= User.new # guest user
   
    if user.role? :admin
      can :see_timestamps, User
      can :manage, :all
    elsif user.role? :secretary
      can [:read, :update], :all
    elsif  user.role? :user
      can :see_timestamps, User, :id => user.id    
      can [:read,:update], User, :id => user.id  
      can :read, [:home]
      can [:update, :edit, :empty], Meeting

    else
      can :read, [:home]
      
    end
  end

end
