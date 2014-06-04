Then(/^that I have a project with another owner$/) do
  @project_owner = create(:user)
  @project = create(:project, user: @user, owners: [@project_owner])
end

When(/^I go to the project owners page$/) do
  visit owners_project_path(@project)
end

Then(/^I am on the owners page for my project$/) do
  page.current_path.should eq(owners_project_path(@project))
end

Then(/^I can add a user to my project$/) do
  @new_owner = User.without([@user, @project.owners]).first
  select(@new_owner.full_name, from: 'Owners')
  click_button 'Save'
end

Then(/^that user is an owner of my project$/) do
  @new_owner.owned_projects.include?(@project).should eq(true)
end

Then(/^I can remove the user from my project$/) do
  unselect(@project_owner.full_name, from: 'Owners')
  click_button 'Save'
end

Then(/^that user is no longer an owner of my project$/) do
  @project_owner.owned_projects.include?(@project).should eq(false)
  @project.owners.include?(@new_owner).should eq(false)
end
