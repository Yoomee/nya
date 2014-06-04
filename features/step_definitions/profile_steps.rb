Given(/^the user has (\d+) created projects$/) do |x|
  @user.created_projects = create_list(:project, x.to_i, user: @user)
end

Given(/^the user has (\d+) owned projects$/) do |x|
  @user.created_projects = create_list(:project, x.to_i, owners: [@user])
end

Then(/^I see the user's projects$/) do
  @user.projects.each do |project|
    page.should have_content(project)
  end
end
