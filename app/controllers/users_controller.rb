class UsersController < ApplicationController
  include YmUsers::UsersController
  load_and_authorize_resource

  autocomplete :user, :full_name, full: true

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.js {}
      else
        format.html { render :edit }
      end
    end
  end

  private
  def permitted_user_parameters
    [:bio, :city, :email, :facebook, :first_name, :image, :last_name, :remove_image, :retained_image, :twitter, :website, :tag_list, interest_ids: [], owner_ids: []]
  end

end
