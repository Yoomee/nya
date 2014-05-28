Given(/^there are (\d+) projects$/) do |x|
  @projects = create_list(:project, x.to_i)
end

When(/^I go to the list of projects$/) do
  visit discover_path
end

Then(/^I see the projects$/) do
  @projects.each do |project|
    page.should have_content(project.title)
    page.should have_content(project.user.full_name)
    page.should have_content(project.city)
    project.tag_list.each do |tag|
      page.should have_content(tag)
    end
  end
end
