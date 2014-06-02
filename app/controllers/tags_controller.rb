class TagsController < ApplicationController
  include YmTags::TagsController

  def autocomplete_tag_name
    @tags = ActsAsTaggableOn::Tag.
      where("name LIKE ?", "#{params[:q]}%").
      order(:name)
    respond_to do |format|
      format.json { render json: @tags , :only => [:id, :name] }
    end
  end

end
