When(/^I enter "(.*?)" in the search box$/) do |term|
  visit forums_path
  fill_in 'q', with: term
  click_button('submit-search')
end

Then(/^I will see the projects for the search "(.*?)"$/) do |term|
  page.current_path.should eq(search_projects_path)
  Project.search(term).each do |project|
    page.should have_content(project.title)
  end
end
