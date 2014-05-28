class ContentPagesController < ApplicationController
  load_and_authorize_resource

  def create
    if @content_page.save
      redirect_to "/#{@content_page.slug}"
    else
      render :new
    end
  end

  def destroy
    @content_page.destroy
    redirect_to content_pages_path, message: 'Page deleted'
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
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
    params.require(:content_page).permit(:link_text, :subtitle, :text, :title, :url)
  end

end
