Given(/^there is an? (\w+) page$/) do |slug|
  @content_page = create(:content_page, title: 'About', slug: slug)
end

When(/^I go to the (\w+) page$/) do |page|
  visit "/#{page}"
end

Then(/^I should see the (\w+\s?\w+) page$/) do |found_page|
  page.should have_content(@content_page.title)
  page.should have_content(@content_page.subtitle)
  page.should have_content(@content_page.text)
end

When(/^I submit the contact form$/) do
  fill_in 'contact_enquiry_email', with: 'example@example.com'
  fill_in 'contact_enquiry_message', with: 'message'
  click_button 'Send'
end
