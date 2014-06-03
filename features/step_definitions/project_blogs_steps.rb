Given(/^that the project has (\d+) blog posts$/) do |x|
  @project.project_blogs = create_list(:project_blog, x.to_i, target: @project)
end

Then(/^I see the blog posts on the project$/) do
  visit project_path(@project)
  @project.project_blogs.each do |blog|
    page.should have_content(blog.text)
  end
end

Given(/^that I have (\d+) project$/) do |arg1|
  @project = create(:project, user: @user)
end

Then(/^I can post a blog post on the project$/) do
  @message = 'A new special message for testing a project'
  click_link('Blog')
  within('#blog') do
    fill_in 'post_text', with: @message
    click_button 'Post'
  end
  wait_for_ajax
end

Then(/^I should see my blog post$/) do
  within('#blog') do
    page.should have_content(@message)
  end
end
