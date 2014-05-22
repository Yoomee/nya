class ProjectsController < ApplicationController

  def index
    @projects = Project.order('created_at DESC')
  end

  def show
    @project = Project.find(params[:id])
  end
  
end
