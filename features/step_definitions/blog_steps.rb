Then(/^that there (?:is|are) (\d+) blog posts?$/) do |x|
  @blog_posts = create_list(:blog_post, x.to_i)
  @blog_post = @blog_posts.first
end

When(/^I go to the blog post$/) do
  visit blog_post_path(@blog_post)
end

Then(/^I should see the blog post$/) do
  page.should have_content(@blog_post.title)
  page.should have_content(@blog_post.subtitle)
  page.should have_content(@blog_post.text)
end

Then(/^I should see all the blog posts$/) do
  @blog_posts.each do |post|
    page.should have_link(post.title, href: blog_post_path(post))
    page.should have_content(post.subtitle)
  end
end
