class NewSignupMailer < ActionMailer::Base
  default from: Settings.site_email
  default to: Settings.site_email
  default bcc: 'support@yoomee.com'

  def new_signup(user)
    @user = user
    mail(:subject => "#{Settings.site_name} - Someone has signed up")
  end
end
