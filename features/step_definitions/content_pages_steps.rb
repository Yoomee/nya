Given(/^there is an about page$/) do
  @content_page = create(:content_page, title: 'About', slug: 'about')
end

When(/^I go to the about page$/) do
  visit "/about"
end

Then(/^I should see the (\w+) page$/) do |found_page|
  page.should have_content(@content_page.title)
  page.should have_content(@content_page.subtitle)
  page.should have_content(@content_page.text)  
end
