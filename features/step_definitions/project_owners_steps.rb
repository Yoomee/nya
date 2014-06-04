Given(/^that I am an owner of a project$/) do
  @project = create(:project, owners: [@user])
end

Then(/^I cannot see a link to delete the project$/) do
  page.should_not have_link('Delete')
end
