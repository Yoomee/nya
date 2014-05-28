When(/^I click on the link to the "(.*?)" forum$/) do |name|
  @forum = Forum.find_by_name(name)
  click_link(@forum.name, href: forum_path(@forum))
end

Then(/^I should not see a form to post a message$/) do
  page.should_not have_content('form[action=/"comments"]')
end

Then(/^I should not see a form to post a comment$/) do
  page.should_not have_content('form[action=/"posts"]')
end

Then(/^I should see a list of links to the forums$/) do
  Forum.all.each do |forum|
    page.should have_link(forum.name, href: forum_path(forum))
  end
end

Then(/^I should see an all link$/) do
  page.should have_link('All', href: forums_path)
end
