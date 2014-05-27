Given(/^there are (\d+) project categories$/) do |x|
  @project_categories = create_list(:project_category, x.to_i)
end

When(/^I select a project category$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see projects for the selected category$/) do
  pending # express the regexp above with the code you wish you had
end
