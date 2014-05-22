Given(/^there are (\d+) projects$/) do |arg1|
  create_list(:project, 3)
  true # express the regexp above with the code you wish you had
end

When(/^I go to the list of projects$/) do
  true # express the regexp above with the code you wish you had
end

Then(/^I see the projects$/) do
  true # express the regexp above with the code you wish you had
end
