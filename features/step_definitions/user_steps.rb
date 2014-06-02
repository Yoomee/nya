Given(/^a user$/) do
  @user = create(:user)
end

Given(/^that I am logged in$/) do
  sign_in_user
end

Given(/^that I am not logged in$/) do
end

Given(/^that I am logged in as an admin$/) do
  sign_in_admin
end

Given(/^there are (\d+) users$/) do |x|
  create_list(:user, x.to_i)
end

When(/^I go to the user profile$/) do
  visit user_path(@user)
end

Then(/^I see the user details$/) do
  %w(first_name last_name city).each do |attr|
    page.should have_content(@user.send(attr))
  end
end

Then(/^I should see the access denied message$/) do
  page.should have_content "You are not authorized to access this page."
end

private
def create_admin
  @user = create(:user, role: 'admin')
end

def create_user
  @user = create(:user)
end

def sign_in
  visit sign_in_path
  within('#login') do
    fill_in 'user_email', :with => @user[:email]
    fill_in 'user_password', :with => 'password'
    click_button 'Sign in'
  end
end

def sign_in_admin
  create_admin
  sign_in
end

def sign_in_user
  create_user
  sign_in
end

