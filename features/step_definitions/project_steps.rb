Given(/^a project$/) do
  @project = create(:project)
end

When(/^I go to the project$/) do
  visit project_url(@project)
end

Then(/^I see the project details$/) do
  page.should have_content(@project.title)
  page.should have_content(@project.description)
  page.should have_content(@project.user.full_name)
  page.should have_content(long_date(@project.deadline))
  page.should have_content(long_date(@project.created_at))
  page.should have_content(@project.purpose)
  page.should have_content(@project.help_needed)
  page.should have_content(@project.city)
end

Then(/^I see the project image$/) do
  pending
end
