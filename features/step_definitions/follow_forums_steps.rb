Then(/^I should be see a "(.*?)" link$/) do |link|
  page.should have_link(link)
end

Then(/^I will follow the forum$/) do
  wait_for_ajax
  @user.followed_forums.include?(@forum).should eq(true)
end

Then(/^I will see the forums I follow on my profile$/) do
  visit user_path(@user)
  @user.followed_forums.each do |forum|
    page.should have_link(forum.name, href: forum_path(forum))
  end
end

Then(/^I will see the lastest posts on my profile$/) do
  @forum.posts.recent do |post|
    page.should have_content(post.title)
  end
end

Given(/^there are (\d+) followers of the "(.*?)" forum$/) do |x, name|
  @forum = Forum.find_by_name(name)
  @forum.followers << create_list(:user, x.to_i)
end

Then(/^I will see the recent followers on the forum$/) do
  @forum.followers.recent.each do |follower|
    page.should have_content(follower.full_name)
  end
end
