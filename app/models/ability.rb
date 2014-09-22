class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      if user.role?(:member)
        can :manage, Contributor
        can :manage, Task
        can :manage, TodoList
        can :create, Comment
        can :create, Attachment
        can :create, Work
        can :destroy, Work do |work|
             work.try(:user) == user
        end
        can :update, Work do |work|
          work.try(:user) == user
        end
      end
    end
  end
end
