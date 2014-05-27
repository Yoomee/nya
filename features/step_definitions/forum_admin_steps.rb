When(/^I go to the new forum page$/) do
  visit new_forum_path
end

When(/^I fill in the forum form appropriately$/) do
  @forum = build(:forum)
  fill_in 'forum_name', with: @forum[:name]
  fill_in 'forum_description', with: @forum[:description]
  click_button 'Save'
end

Then(/^I should see the new forum$/) do
  page.should have_content(@forum.name)
  page.should have_content(@forum.description)
end
