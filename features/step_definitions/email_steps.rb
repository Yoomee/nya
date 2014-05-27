Then(/^it should send an? "(.*?)" email$/) do |arg1|
  # TODO - not sure why this doesn't work
  # See http://guides.rubyonrails.org/testing.html#testing-your-mailers
  # and http://stevelorek.com/actionmailer-cucumber.html
  # and http://stackoverflow.com/questions/14735501/testing-email-gets-sent-in-cucumber
  # @email = ActionMailer::Base.deliveries.last
  # @email.to.should include Settings.site_email
  # @email.subject.should include(arg1)
  pending
end
