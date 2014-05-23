# Don't delete comments! They are used in gems for adding abilities
class Ability

  include CanCan::Ability

  def initialize(user)

    # open ability
    can :show, ContentPage

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
      can [:read, :create], Project
      can [:update, :destroy], Project, :user_id => user.id
    end

  end

end
