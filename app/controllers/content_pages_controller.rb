class ContentPagesController < ApplicationController
  load_and_authorize_resource :find_by => :slug

  def show
  end

end
