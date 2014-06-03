# GIVEN
Given(/^there are (\d+) forums$/) do |x|
  @forums = create_list(:forum, x.to_i)
end

Given(/^there is a "(.*?)" forum$/) do |name|
  @forum = create(:forum, name: name)
end

# WHEN
When(/^I add the project category to the forum$/) do
  select(@project_category.name, from: 'Project category')
  click_button 'Save'
end

When(/^I click on the forum 'delete' link$/) do
  click_link 'Delete'
end

When(/^I fill in the forum form appropriately$/) do
  @forum = build(:forum)
  fill_in 'forum_name', with: @forum[:name]
  fill_in 'forum_description', with: @forum[:description]
  click_button 'Save'
end

When(/^I go to the home page for forums$/) do
  visit forums_path
end

When(/^I go to the new forum page$/) do
  visit new_forum_path
end

When(/^I go to edit the "(.*?)" forum$/) do |name|
  visit edit_forum_path(@forum)
end

When(/^I go to manage the forums$/) do
  visit manage_forums_path
end

When(/^I go to the "(.*?)" forum$/) do |name|
  @forum = Forum.find_by_name(name)
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
  page.current_path.should eq(forums_path)
end

Then(/^I should see the manage page for forums$/) do
  page.current_path.should eq(manage_forums_path)
end

Then(/^I should see the ([^"].*?) forum$/) do |found_page|
  page.should have_content(@forum.name)
  page.should have_content(@forum.description)
end

Then(/^I should see the "(\w+)" forum$/) do |name|
  @forum = Forum.find_by_name(name)
  page.should have_content(@forum.name)
  page.should have_content(@forum.description)
end

Then(/^the sport forum should be deleted$/) do
  Forum.find_by_name('Sport').nil?
end


Then(/^I should see all the forums$/) do
  Forum.all.each do |forum|
    page.should have_content(forum.name)
  end
end

Then(/^the forum should show the latest projects from the project category$/) do
  @forum = Forum.find_by_name('sport')
  visit forum_path(@forum)
  @forum.project_category.projects.recent(2).each do |project|
    page.should have_content(project.title)
  end
end
