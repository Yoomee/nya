Then(/^I should not see a form to post a message$/) do
  page.should_not have_content('form[action=/"comments"]')
end

Then(/^I should not see a form to post a comment$/) do
  page.should_not have_content('form[action=/"posts"]')
end
