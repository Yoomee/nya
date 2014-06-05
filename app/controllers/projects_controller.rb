class ProjectsController < ApplicationController

  before_action :authenticate_user!, :only => [:destroy, :new]
  load_and_authorize_resource

  def search
    @query = params[:q]
    @projects = @query.present? ? Project.search(@query) : Project.all
  end

  def show
    @contact_enquiry = ContactEnquiry.new(
      email: current_user.try(:email),
      name: current_user.try(:full_name)
    )
  end

  def new
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

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to discover_path, message: 'Project deleted'
  end

  def offer_help
    @contact_enquiry = ContactEnquiry.new(params[:contact_enquiry])
    if @contact_enquiry.valid?
      HelpMailer.help_offer(@contact_enquiry, @project).deliver
      @project.add_helper(current_user)
      render :json => @contact_enquiry.to_json
    else
      render :json => { :errors => @contact_enquiry.errors.full_messages }, :status => 422
    end
  end

  def owners
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :city,
      :feature_on_community_homepage,
      :feature_on_homepage,
      :image,
      :help_needed,
      :purpose,
      :deadline,
      :project_category_id,
      :retained_image,
      :removed_image,
      :tag_list,
      owner_ids: []
    )
  end

end
