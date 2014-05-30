Given(/^there are (\d+) project categories$/) do |x|
  @project_categories = create_list(:project_category, x.to_i)
end

Given(/^there are (\d+) projects in a project category$/) do |x|
  @project_category = create(:project_category)
  x.to_i.times {
    @project = create(:project, project_category: @project_category)
  }
end

Given(/^each project category has (\d+) projects$/) do |x|
  @project_categories.each do |category|
    create_list(:project, x.to_i, project_category: category)
  end
end

When(/^I visit a project category$/) do
  pc = @project_category || @project_categories.first
  visit "/discover/#{pc.slug}"
end

Then(/^I can see projects for the selected category$/) do
  @project_categories.first.projects do |project|
    page.should have_content(project.name)
  end
end
