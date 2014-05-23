class ContentPagesController < ApplicationController
  load_and_authorize_resource :find_by => :slug

  def create
    if @content_page.save
      redirect_to "/#{@content_page.slug}"
    else
      render :new
    end
  end

  def new
  end

  def show
    puts params[:id]
  end

  private
  def content_page_params
    params.require(:content_page).permit(:slug, :subtitle, :text, :title)
  end

end
