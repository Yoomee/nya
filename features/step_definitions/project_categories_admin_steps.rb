When(/^I go to the new project category page$/) do
  visit new_project_category_path
end

When(/^I fill in the project category form$/) do
  @project_category = build(:project_category)
  fill_in 'project_category_name', with: @project_category[:name]
  fill_in 'project_category_description', with: @project_category[:description]
  fill_in 'project_category_slug', with: @project_category[:slug]
  click_button 'Save'
end

Then(/^I should see the new project category$/) do
  visit discover_project_category_path(@project_category)
end

Given(/^there is an (\w+) project category$/) do |category_name|
  @project_category = create(
    :project_category,
    name: category_name,
    slug: category_name.downcase
  )
end

When(/^I go to edit the art project category$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I update the art project category$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the art project category$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the art project category should be deleted$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the art project category$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of all the project categories$/) do
  pending # express the regexp above with the code you wish you had
end