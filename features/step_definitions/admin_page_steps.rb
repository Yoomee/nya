When(/^I go to the admin page$/) do
  visit admin_path
end

Then(/^I should see the heading 'Admin'$/) do
  page.should have_content('Admin')
end
