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
  within('.project-head') do
    click_link('Blog')
  end
  within('#blog') do
    fill_in 'post_text', with: @message
    page.execute_script("$('form#new_post').submit()")
  end
  wait_for_ajax
end

Then(/^I should see my blog post$/) do
  within('#blog') do
    page.should have_content(@message)
  end
end

Then(/^I cannot post a blog post on the project$/) do
  within('#blog') do
    page.should_not have_css('.form-group#post_text_input')
  end
end

Given(/^my project has a blog post$/) do
  @post = create(:project_blog, target: @project, user: @user)
  @project.project_blogs << @post
end

Then(/^I should be able to delete my blog post$/) do
  @posts_count = @project.posts.count
  within('.project-head') do
    click_link('Blog')
  end
  within("#post#{@post.id}") do
    click_link '', href: post_path(@post)
  end
  wait_for_ajax
end

Then(/^my blog post should be deleted$/) do
  @project.posts.count.should eq(@posts_count - 1)
end
