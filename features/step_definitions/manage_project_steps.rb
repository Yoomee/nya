Given(/^I have created a project$/) do
  @project = create(:project, user: @user)
end

When(/^I click on the "(.*?)" link$/) do |name|
  click_link name
end

Then(/^I can update the project$/) do
  project_title = "Updated unique title"
  @project[:title] = project_title
  fill_in 'project_title', with: @project[:title]
  fill_in 'project_purpose', with: @project[:purpose]
  fill_in 'project_description', with: @project[:description]
  fill_in 'project_help_needed', with: @project[:help_needed]
  fill_in 'project_deadline', with: @project[:deadline]
  fill_in 'project_city', with: @project[:city]
  click_button 'Done editing'
  @project = Project.find_by_title(project_title)
end

Then(/^I cannot see an "(.*?)" link$/) do |name|
  page.should_not have_link(name, edit_project_path(@project))
end

Given(/^a project that I did not create$/) do
  other_user = create(:user)
  @project = create(:project, user: other_user)
end
