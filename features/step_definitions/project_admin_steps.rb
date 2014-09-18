When(/^I go to edit the project$/) do
  visit edit_project_path(@project)
end

When(/^I update the project$/) do
  @project.title = 'New title'
  @project.inspiration = 'New inspiration'
  @project.who_helping = 'New who_helping'
  @project.skills_needed = 'New skills_needed'
  @project.deadline = '2015-07-12'
  @project.city = 'New city'

  fill_in 'project_title', :with => @project.title
  fill_in 'project_inspiration', :with => @project.inspiration
  fill_in 'project_who_helping', :with => @project.who_helping
  fill_in 'project_skills_needed', :with => @project.skills_needed
  fill_in 'project_deadline', :with => @project.deadline
  fill_in 'project_city', :with => @project.city
  click_button 'Done editing', match: :first
end

Then(/^I should be able to edit the project$/) do
  page.current_path.should eq(edit_project_path(@project))
end
