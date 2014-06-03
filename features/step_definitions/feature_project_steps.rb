Then(/^I should be able to feature the project on the homepage$/) do
  check('project_feature_on_homepage')
  click_button 'Done editing'
end

Then(/^I should see the project on the homepage$/) do
  visit root_path
  page.should have_content(@project.title)
end
