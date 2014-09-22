When(/^I fill in the blog form appropriately$/) do
  @blog_post = build(:blog_post)
  fill_in 'blog_post_title', with: @blog_post[:title]
  fill_in 'blog_post_subtitle', with: @blog_post[:subtitle]
  fill_in 'blog_post_text', with: @blog_post[:text]
  click_button('Save')
end

When(/^I go to edit the blog post$/) do
  visit edit_blog_post_path(@blog_post)
end

When(/^I update the blog post$/) do
  @blog_post[:title] = 'New title'
  @blog_post[:subtitle] = 'New subtitle'
  @blog_post[:text] = 'New text'
  fill_in 'blog_post_title', with: @blog_post[:title]
  fill_in 'blog_post_subtitle', with: @blog_post[:subtitle]
  fill_in 'blog_post_text', with: @blog_post[:text]
  click_button 'Save'
end

When(/^I go to the first blog post$/) do
  visit blog_post_path(@blog_post)
end

Then(/^the blog post should be deleted$/) do
  BlogPost.find_by_title(@blog_post.title).nil?
end
