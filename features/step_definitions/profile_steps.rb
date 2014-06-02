Given(/^the user has (\d+) projects$/) do |x|
  @user.projects = create_list(:project, x.to_i, user: @user)
end

Then(/^I see the user's projects$/) do
  @user.projects.each do |project|
    page.should have_content(project)
  end
end
