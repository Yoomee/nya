class ForumsController < ApplicationController
  load_and_authorize_resource

  def create
    if @forum.save
      redirect_to @forum
    else
      render :new
    end
  end

  def new
  end

  private
  def forum_params
    params.require(:forum).permit(:name, :description, :image)
  end

end
