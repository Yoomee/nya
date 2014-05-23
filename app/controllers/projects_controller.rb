class ProjectsController < ApplicationController

  before_action :authenticate_user!, :only => [:destroy, :new]

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
    @project = Project.new(params[:project])
  end

end
