class ProjectCategoriesController < ApplicationController

  def index
    @project_categories = ProjectCategory.all
    @projects = Project.order('created_at DESC')
  end

  def show
    @project_category = ProjectCategory.find_by_slug(params[:slug])
  end

end
