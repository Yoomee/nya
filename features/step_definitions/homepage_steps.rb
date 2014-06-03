
When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the homepage$/) do
  page.current_path.should eq(root_path)
end

Then(/^I should see the project categories on the homepage$/) do
  @project_categories.each do |category|
    page.should have_content(category.name)
  end
end

Then(/^I should see the most recent projects on the homepage$/) do
  category = @project_categories.first
  @project_categories.each do |category|
    within("##{category.to_param}") do
      category.projects.recent(3).each do |project|
        page.should have_content(project.title)
      end
    end
  end
end


Then(/^I should see the most recent users on the homepage$/) do
  User.recent.each do |user|
    page.should have_content(user.full_name)
  end
end
