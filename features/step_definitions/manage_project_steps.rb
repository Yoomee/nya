Given(/^I have created a project$/) do
  @project = create(:project, user: @user)
end

When(/^I click on the "(.*?)" link$/) do |name|
  click_link name, match: :first
end

Then(/^I can update the project$/) do
  project_title = "Updated unique title"
  @project[:title] = project_title
  click_button 'Done editing', match: :first
  @project = Project.find_by_title(project_title)
end

Then(/^I cannot see an "(.*?)" link$/) do |name|
  page.should_not have_link(name, edit_project_path(@project))
end

Given(/^a project that I did not create$/) do
  other_user = create(:user)
  @project = create(:project, user: other_user)
end
