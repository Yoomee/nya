Given(/^there is an about page$/) do
  # pending # express the regexp above with the code you wish you had
  @content_page = create(:content_page, title: 'About', slug: 'about')
end

When(/^I go to the about page$/) do
  visit "/#{@content_page.slug}"
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

Then(/^I should see the (\w+) page$/) do |found_page|
  page.should have_content(@content_page.title)
  page.should have_content(@content_page.subtitle)
  page.should have_content(@content_page.text)  
end

