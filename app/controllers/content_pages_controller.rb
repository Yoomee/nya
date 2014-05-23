class ContentPagesController < ApplicationController
  load_and_authorize_resource :find_by => :slug

  def create
    if @content_page.save
      redirect_to "/#{@content_page.slug}"
    else
      render :new
    end
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
    puts params[:id]
  end

  def update
    if @content_page.update(content_page_params)
      redirect_to "/#{@content_page.slug}"
    else
      render :edit
    end
  end

  private
  def content_page_params
    params.require(:content_page).permit(:slug, :subtitle, :text, :title)
  end

end
