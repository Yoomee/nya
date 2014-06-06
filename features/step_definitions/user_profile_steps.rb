Given(/^my user profile has no location$/) do
  @user.city.should equal(nil)
end

Given(/^my user profile has a location$/) do
  @user.city = 'Exeter'
  @user.save
end

When(/^complete the add location form$/) do
  fill_in 'user_city', with: 'Exeter'
  click_button 'location-form-btn'
end

Then(/^my location is displayed on my profile page$/) do
  page.should have_content('Exeter')
end

Then(/^there is no add location form$/) do
  page.should_not have_css('#profile-location-form')
end
