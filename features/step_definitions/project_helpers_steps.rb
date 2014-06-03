Then(/^I should see the thank you message$/) do
  wait_for_ajax
  page.should have_content('Thank you')
end

And(/^the project should have a helper$/) do
  @project.helpers.count.should eq(1)
end
