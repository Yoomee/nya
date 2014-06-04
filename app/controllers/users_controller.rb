class UsersController < ApplicationController
  include YmUsers::UsersController
  load_and_authorize_resource

  def show
    @contact_enquiry = ContactEnquiry.new(
      email: current_user.try(:email),
      name: current_user.try(:full_name)
    )
  end

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

  def request_help
    @contact_enquiry = ContactEnquiry.new(params[:contact_enquiry])
    if @contact_enquiry.valid?
      HelpMailer.help_request(@contact_enquiry, @user, current_user).deliver
      render :json => @contact_enquiry.to_json
    else
      render :json => { :errors => @contact_enquiry.errors.full_messages }, :status => 422
    end
  end

  private
  def permitted_user_parameters
    [:bio, :city, :email, :facebook, :first_name, :image, :last_name, :remove_image, :retained_image, :twitter, :website, :tag_list, interest_ids: [], owner_ids: []]
  end

end
