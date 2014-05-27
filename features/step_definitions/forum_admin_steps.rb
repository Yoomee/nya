# GIVEN
Given(/^there are (\d+) forums$/) do |x|
  @forums = create_list(:forum, x.to_i)
end

Given(/^there is a sport forum$/) do
  @forum = create(:forum, name: 'Sport')
end

# WHEN
When(/^I click on the forum 'delete' link$/) do
  click_link 'Delete'
end

When(/^I fill in the forum form appropriately$/) do
  @forum = build(:forum)
  fill_in 'forum_name', with: @forum[:name]
  fill_in 'forum_description', with: @forum[:description]
  click_button 'Save'
end

When(/^I go to the new forum page$/) do
  visit new_forum_path
end

When(/^I go to edit the sport forum$/) do
  visit edit_forum_path(@forum)
end

When(/^I go to the sport forum$/) do
  visit forum_path(@forum)
end

When(/^I update the sport forum$/) do
  @forum.name = 'New name'
  @forum.description = 'New description'
  fill_in 'forum_name', with: @forum[:name]
  fill_in 'forum_description', with: @forum[:description]
  click_button 'Save'
end

# THEN
Then(/^I should see the home page for forums$/) do
  page.should have_content('Community')
  page.current_path.should eq('/forum')
end

Then(/^I should see the (\w+) forum$/) do |found_page|
  page.should have_content(@forum.name)
  page.should have_content(@forum.description)
end

Then(/^the sport forum should be deleted$/) do
  Forum.find_by_name('Sport').nil?
end
