class Ability
  def initialize(user)
    return unless user
    
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Comment
      can :update, Comment do |comment|
        comment.user == user
      end
      can :delete, Comment do |comment|
        comment.user == user
      end
    end
  end
end