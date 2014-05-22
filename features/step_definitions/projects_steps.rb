Given(/^there are (\d+) projects$/) do |x|
  @projects = create_list(:project, x.to_i)
end

When(/^I go to the list of projects$/) do
  visit projects_path
end

Then(/^I see the projects$/) do
  false # express the regexp above with the code you wish you had
end
