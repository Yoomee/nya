Given(/^I have posted a message in the forum$/) do
  puts @forum
  @post = create(:post, text: 'This is a special message that I will delete', target: @forum, user: @user)
end

Given(/^there are (\d+) messages in the "(.*?)" forum$/) do |x, name|
  @forum = Forum.find_by_name(name)
  create_list(:post, x.to_i, target: @forum)
end

Then(/^I should be see the (\d+) messages in the "(.*?)" forum$/) do |x, name|
  @forum = Forum.find_by_name(name)
  @forum.posts.count == x.to_i
  @forum.posts.each do |post|
    page.should have_content(post.text)
  end
end

Then(/^I should be able to post a message$/) do
  post_count = @forum.posts.count
  @message = 'A new special message for testing'
  fill_in 'post_text', with: @message
  click_button 'Post'
  @forum.posts.count.should eq(post_count + 1)
  wait_for_ajax
end

Then(/^I should be able to read my message$/) do
  page.should have_content(@message)
end

Then(/^I should be able to delete my message$/) do
  @posts_count = @forum.posts.count
  within("#post#{@post.id}") do
    click_link '', href: post_path(@post)
  end
  wait_for_ajax
end

Then(/^my message should be deleted$/) do
  @forum.posts.count.should eq(@posts_count - 1)
end
