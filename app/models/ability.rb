# Don't delete comments! They are used in gems for adding abilities
class Ability

  include CanCan::Ability

  def initialize(user)

    # open ability
    can :show, ContentPage
    can :read, Forum
    can [:search, :show], Project
    can [:index, :show], ProjectCategory
    can :show, User
    can :show, Tag

    if user.try(:admin?)
      can :manage, :all
      # admin ability
    elsif user
      # user ability
      can :index, Notification
      can [:read, :create, :file], Post
      can [:update, :destroy], Post, :user_id => user.id
      can [:create], Comment
      can :request_help, User
      can :manage, User, :id => user.id
      can [:create, :offer_help], Project
      can [:edit, :update, :destroy, :owners], Project, :user_id => user.id
      can [:edit, :update, :owners], Project do |project|
        project.owners.include?(user)
      end
      can :create, Tag
    end

  end

end
