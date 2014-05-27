Given(/^there are (\d+) project categories$/) do |x|
  @project_categories = create_list(:project_category, x.to_i)
end

When(/^I visit a project category$/) do
  visit "/discover/#{@project_categories.first.slug}"
end

Then(/^I can see projects for the selected category$/) do
  @project_categories.first.projects do |project|
    page.should have_content(project.name)
  end
end
