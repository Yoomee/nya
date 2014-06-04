When(/^I go to edit the project$/) do
  visit edit_project_path(@project)
end

When(/^I update the project$/) do
  @project.title = 'New title'
  @project.purpose = 'New purpose'
  @project.description = 'New description'
  @project.help_needed = 'New help_needed'
  @project.deadline = '2015-07-12'
  @project.city = 'New city'

  fill_in 'project_title', :with => @project.title
  fill_in 'project_purpose', :with => @project.purpose
  fill_in 'project_description', :with => @project.description
  fill_in 'project_help_needed', :with => @project.help_needed
  fill_in 'project_deadline', :with => @project.deadline
  fill_in 'project_city', :with => @project.city
  click_button 'Done editing'
end

Then(/^I should be able to edit the project$/) do
  page.current_path.should eq(edit_project_path(@project))
end

