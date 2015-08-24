class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.employee?
      can :manage, :all
    elsif user.customer?
      
    end
  end
end