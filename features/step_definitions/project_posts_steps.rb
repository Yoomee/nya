Given(/^that the project has (\d+) posts$/) do |x|
  @project.project_comments << create_list(:project_comment, x.to_i, target: @project)
end

Given(/^that I have posted on the project$/) do
  @post = create(:project_comment, target: @project, user: @user)
end

Then(/^I can post on the project$/) do
  @message = 'A new special message for testing a project'
  click_link('Comments')
  within('#comments') do
    fill_in 'post_text', with: @message
    page.execute_script("$('form#new_post').submit()")
  end
  wait_for_ajax
end

Then(/^I see the posts on the project$/) do
  @project.project_comments.each do |post|
    page.should have_content(post.text)
  end
end

Then(/^I should see my post$/) do
  within('#comments') do
    page.should have_content(@message)
  end
end

Then(/^I should be able to delete my post$/) do
  @posts_count = @project.posts.count
  click_link('Comments')
  within("#post#{@post.id}") do
    click_link '', href: post_path(@post)
  end
  wait_for_ajax
end

Then(/^my post should be deleted$/) do
  @project.posts.count.should eq(@posts_count - 1)
end

Then(/^I should be able to comment on a post$/) do
  click_link('Comments')
  @message = 'A comment on a project post'
  within("#post#{@project.project_comments.first.id}") do
    click_link 'Write the first comment'
    fill_in 'comment[text]', with: @message
    # form has no submit button - submit by pressing enter
    find_field('comment[text]').native.send_key(:Enter)
  end
  wait_for_ajax
end

Then(/^I should see my comment$/) do
  page.should have_content(@message)
end
