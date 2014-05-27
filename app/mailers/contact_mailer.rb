class ContactMailer < ActionMailer::Base
  default from: Settings.site_email
  default to: Settings.site_email
  default bcc: 'support@yoomee.com'

  def contact_enquiry(contact_enquiry)
    @contact_enquiry = contact_enquiry
    mail(:subject => "#{Settings.site_name} - a new message from the contact page")
  end
end
