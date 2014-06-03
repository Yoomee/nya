Given(/^that the project has (\d+) posts$/) do |x|
  @project.project_comments << create_list(:project_comment, x.to_i, target: @project)
end

Then(/^I can post on the project$/) do
  @message = 'A new special message for testing a project'
  click_link('Comments')
  within('#comments') do
    fill_in 'post_text', with: @message
    click_button 'Post'
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
