# Don't delete comments! They are used in gems for adding abilities
class Ability

  include CanCan::Ability

  def initialize(user)

    # open ability
    can :show, ContentPage
    can :read, Forum
    can :show, Project
    can [:index, :show], ProjectCategory
    can :show, User

    if user.try(:admin?)
      can :manage, :all
      # admin ability
    elsif user
      # user ability
      can :index, Notification
      can [:read, :create, :file], Post
      can [:update, :destroy], Post, :user_id => user.id
      can [:create], Comment
      can :manage, User, :id => user.id
      can [:create], Project
      can [:edit, :update, :destroy], Project, :user_id => user.id
    end

  end

end
