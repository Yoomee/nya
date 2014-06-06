Then(/^it should send an? "(.*?)" email$/) do |subject|
  @email = ActionMailer::Base.deliveries.first
  @email.to.should include Settings.site_email
  @email.subject.should include(subject)
end
