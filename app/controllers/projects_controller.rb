class ProjectsController < ApplicationController

  before_action :authenticate_user!, :only => [:destroy, :new]
  load_and_authorize_resource

  def index
    @projects = Project.order('created_at DESC')
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :city,
      :image,
      :help_needed,
      :purpose,
      :deadline,
      :project_category_id
    )
  end

end
