When(/^I go to the project create page$/) do
  visit new_project_path
end

Then(/^I can create a project$/) do
  project_title = 'Create project test title'
  @project = build(:project,  title: project_title)
  fill_in 'project_title', :with => @project[:title]
  fill_in 'project_inspiration', :with => @project[:inspiration]
  fill_in 'project_who_helping', :with => @project[:who_helping]
  fill_in 'project_how_helping', :with => @project[:how_helping]
  fill_in 'project_skills_have', :with => @project[:skills_have]
  fill_in 'project_skills_needed', :with => @project[:skills_needed]
  fill_in 'project_step1', :with => @project[:step1]
  fill_in 'project_deadline', :with => @project[:deadline]
  fill_in 'project_city', :with => @project[:city]
  select @project_categories.first.name, from: 'project_project_category_id'
  click_button 'Create your project'
  @project = Project.find_by_title(project_title)
end

Then(/^I am redirected to the signup page$/) do
  page.current_path.should == new_user_session_path
end

Then(/^the project location is geocoded$/) do
  expect(@project.latitude).to eq(53.9599651)
  expect(@project.longitude).to eq(-1.0872979)
end
