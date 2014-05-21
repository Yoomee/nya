class WireframesController < ApplicationController
  def show
    if params[:path].present?
      render :template => "wireframes/#{params[:path]}"
    else
      render :action => 'index'
    end
  end
end
