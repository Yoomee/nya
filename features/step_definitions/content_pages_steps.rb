Given(/^there is an about page$/) do
  # pending # express the regexp above with the code you wish you had
  @content_page = create(:content_page, title: 'About', slug: 'about')
end

When(/^I go to the about page$/) do
  visit "/#{@content_page.slug}"
end

Then(/^I should see the about page$/) do
  page.should have_content(@content_page.title)
  page.should have_content(@content_page.subtitle)
  page.should have_content(@content_page.text)  
end
