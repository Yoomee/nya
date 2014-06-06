class ForumUsersController < ApplicationController
  before_action :set_forum

  def create
    authorize! :follow, @forum
    current_user.forum_users.create(forum: @forum)
  end

  def destroy
    authorize! :unfollow, @forum
    current_user.forum_users.find_by(forum: @forum).destroy
  end

  private
  def set_forum
    @forum = Forum.friendly.find(params[:id])
  end
end
