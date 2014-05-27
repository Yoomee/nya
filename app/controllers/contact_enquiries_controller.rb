class ContactEnquiriesController < ApplicationController

  def create
    @contact_enquiry = ContactEnquiry.new(params[:contact_enquiry])
    if @contact_enquiry.valid?
      ContactMailer.contact_enquiry(@contact_enquiry).deliver
      @content_page = ContentPage.find_by_slug('thanks')
    else
      @content_page = ContentPage.find_by_slug('contact')
    end
    render 'content_pages/show'
  end

end
