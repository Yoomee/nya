Then(/^I should see the thank you message$/) do
  wait_for_ajax
  page.should have_content('Thank you')
end

Then(/^it should send an "(.*?)" email to the project creator$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the project should have a helper$/) do
  pending # express the regexp above with the code you wish you had
end
