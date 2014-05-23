Given(/^that I am logged in$/) do
  sign_in_user
end

Given(/^that I am not logged in$/) do
end

Given(/^that I am logged in as an admin$/) do
  sign_in_admin
end

Then(/^I should see the access denied page$/) do
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
  fill_in 'user_email', :with => @user[:email]
  fill_in 'user_password', :with => 'password'
  click_button 'Login'
end

def sign_in_admin
  create_admin
  sign_in
end

def sign_in_user
  create_user
  sign_in
end
