Given(/^there are (\d+) content_pages$/) do |x|
  @content_pages = create_list(:content_page, x.to_i)
end

When(/^I click on the 'delete' link$/) do
  click_link 'delete'
end

When(/^I click on the 'Manage pages' link$/) do
  click_link 'Manage pages'
end


When(/^I go to edit the about page$/) do
  visit "/pages/#{@content_page.slug}/edit"
end

When(/^I go to the new content_page page$/) do
  visit 'pages/new'
end

When(/^I fill in the content_page form appropriately$/) do
  @content_page = build(:content_page)
  fill_in 'content_page_title', with: @content_page[:title]
  fill_in 'content_page_subtitle', with: @content_page[:subtitle]
  fill_in 'content_page_text', with: @content_page[:text]
  fill_in 'content_page_slug', with: @content_page[:slug]
  click_button 'Save'
end

When(/^I update the about page$/) do
  @content_page[:title] = 'New title'
  @content_page[:subtitle] = 'New subtitle'
  @content_page[:text] = 'New text'
  fill_in 'content_page_title', with: @content_page[:title]
  fill_in 'content_page_subtitle', with: @content_page[:subtitle]
  fill_in 'content_page_text', with: @content_page[:text]
  click_button 'Save'
end

Then(/^I should see a list of all the pages$/) do
  ContentPage.all.each do |content_page|
    page.should have_link(content_page.title, href: "/#{content_page.slug}")
  end
end

Then(/^the about page should be deleted$/) do
  ContentPage.find_by_slug('about').nil?
end
