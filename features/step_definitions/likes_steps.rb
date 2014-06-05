When(/^I click on the project like link$/) do
  page.first('.card-likes > a').click
end

Then(/^the project like count is increased by one$/) do
  wait_for_ajax
  page.first('.card-likes > a').should have_content(@project.likings.count)
  @project.likings.count.should equal(1)
end
