class ForumsController < ApplicationController
  load_and_authorize_resource

  def create
    if @forum.save
      redirect_to @forum
    else
      render :new
    end
  end

  def destroy
    @forum.destroy
    redirect_to manage_forums_path
  end

  def edit
  end

  def manage
  end

  def new
  end

  def show
  end

  def update
    if @forum.update(forum_params)
      redirect_to @forum
    else
      render :edit
    end
  end

  private
  def forum_params
    params.require(:forum).permit(:name, :description, :image, :remove_image, :project_category_id)
  end

end
