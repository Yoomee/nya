When(/^I click on the like link for the project$/) do
  page.first('.like-link').click
end

Then(/^the project like count is increased by one$/) do
  wait_for_ajax
  page.first('.like-link').should have_content(@project.likings.count)
  @project.likings.count.should equal(1)
end

Then(/^the project page like count is increased by one$/) do
  wait_for_ajax
  page.first('a#like-us-button').should have_content(@project.likings.count)
  @project.likings.count.should equal(1)
end
