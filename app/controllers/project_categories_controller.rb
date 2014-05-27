class ProjectCategoriesController < ApplicationController

  load_and_authorize_resource

  def index
    @project_categories = ProjectCategory.all
    @projects = Project.order('created_at DESC')
  end

  def show
    @project_category = ProjectCategory.includes(:projects).find_by_slug(params[:slug])
  end

  def new
  end

end
