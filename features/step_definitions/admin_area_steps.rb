When(/^I go to the admin area$/) do
  visit admin_path
end

Then(/^I should see the admin area$/) do
  page.should have_content('Admin')
end
