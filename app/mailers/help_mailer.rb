class HelpMailer < ActionMailer::Base
  default from: Settings.site_email
  default to: Settings.site_email
  default bcc: 'support@yoomee.com'

  def help_offer(contact_enquiry, project)
    @contact_enquiry = contact_enquiry
    @project = project
    mail(
      :to => @project.user.email,
      :from => @contact_enquiry.email,
      :subject => "#{Settings.site_name} - an offer to help on #{@project.title}"
    )
  end

  def help_request(contact_enquiry, potential_helper)
    # TODO: handle user asking another user to help

  end

end
