Given(/^there are (\d+) projects$/) do |x|
  @projects = create_list(:project, x.to_i)
end

When(/^I go to the list of projects$/) do
  visit projects_path
end

Then(/^I see the projects$/) do
  @projects.each do |project|
    expect(page).to have_content(project.title)
    expect(page).to have_content(project.user.full_name)
  end
end
