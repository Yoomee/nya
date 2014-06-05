When(/^I enter "(.*?)" in the search box$/) do |query|
  visit forums_path
  fill_in 'q', with: query
  click_button('submit-search')
end

Then(/^I will see the projects for the search "(.*?)"$/) do |query|
  page.current_path.should eq(search_projects_path)
  Project.search(query).each do |project|
    page.should have_content(project.title)
  end
end

Given(/^the projects have different tags$/) do
  @projects.each_with_index do |project, idx|
    project.tag_list.add("tag#{idx}")
    project.save
  end
end

When(/^I filter by one of the tags$/) do
  within('#tags') do
    click_link('tag3')
  end
end

Then(/^I will see the projects for the search "(.*?)" with the correct tags$/) do |query|
  Project.search(query).joins(:tags).where(tags: { name: 'tag3' }).each do |project|
    page.should have_content(project.title)
  end
  page.should_not have_content(Project.joins(:tags).where(tags: { name: 'tag1'}).first.title)
end
