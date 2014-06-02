Given(/^that the project has (\d+) posts$/) do |x|
  @project.posts = create_list(:post, x.to_i, target: @project)
end

Then(/^I can post on the project$/) do
  post_count = @project.posts.count
  @message = 'A new special message for testing a project'
  fill_in 'post_text', with: @message
  click_button 'Post'
  @project.posts.count.should eq(post_count + 1)
end

Then(/^I see the posts on the project$/) do
  @project.posts.each do |post|
    page.should have_content(post.text)
  end
end

Then(/^I should see my post$/) do
  visit project_path(@project)
  page.should have_content(@message)
end
