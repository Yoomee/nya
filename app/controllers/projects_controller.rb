class ProjectsController < ApplicationController

  before_action :authenticate_user!, :only => [:destroy, :new]
  load_and_authorize_resource

  def search
    @query = params[:q]
    @projects = @query.present? ? Project.search(@query) : Project.all
  end

  def near
    distance = 15
    @query = "projects near #{@project.city}"
    if @project.geocoded?
      @projects = @project.nearbys(distance)
    else
      @projects = Project.near(@project.city_with_uk, distance)
    end
    render 'search'
  end

  def show
    @contact_enquiry = ContactEnquiry.new(
      email: current_user.try(:email),
      name: current_user.try(:full_name)
    )
    @project_blogs = @project.project_blogs.paginate(page: params[:project_blogs_page])
    @project_comments = @project.project_comments.paginate(page: params[:project_blogs_page])
    respond_to do |format|
      format.html {}
      format.js {}
    end
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
      :inspiration,
      :who_helping,
      :how_helping,
      :step1,
      :step2,
      :step3,
      :step4,
      :step5,
      :city,
      :feature_on_community_homepage,
      :feature_on_homepage,
      :image,
      :skills_have,
      :skills_needed,
      :deadline,
      :project_category_id,
      :retained_image,
      :removed_image,
      :tag_list,
      owner_ids: []
    )
  end

end
