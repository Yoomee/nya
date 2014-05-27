class ProjectCategoriesController < ApplicationController

  load_and_authorize_resource :find_by => :slug

  def index
    @project_categories = ProjectCategory.all
    @projects = Project.order('created_at DESC')
  end

  def show
    @project_category = ProjectCategory.includes(:projects).find_by_slug(params[:slug])
  end

  def new
  end

  def create
    if @project_category.save
      redirect_to discover_project_category_path(@project_category)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project_category.update(project_category_params)
      redirect_to discover_project_category_path(@project_category)
    else
      render :edit
    end
  end

  def destroy
    @project_category.destroy
    redirect_to discover_path, message: 'Project category deleted'
  end

  private

  def project_category_params
    params.require(:project_category).permit(
      :name,
      :description,
      :slug
    )
  end

end
