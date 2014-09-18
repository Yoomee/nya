Given(/^a project$/) do
  @project = create(:project)
end

Given(/^a project that is featured on the forum homepage$/) do
  @project = create(:project, feature_on_community_homepage: true)
end

Given(/^a project that is featured on the homepage$/) do
  @project = create(:project, feature_on_homepage: true)
end


When(/^I go to the project$/) do
  visit project_path(@project)
end

When(/^I go edit to the project$/) do
  visit edit_project_path(@project)
end

Then(/^I see the project details$/) do
  page.should have_content(@project.title)
  page.should have_content(@project.inspiration)
  page.should have_content(@project.who_helping)
  page.should have_content(@project.how_helping)
  page.should have_content(@project.user.full_name)
  page.should have_content(long_date(@project.deadline))
  page.should have_content(long_date(@project.created_at))
  page.should have_content(@project.step1)
  page.should have_content(@project.skills_have)
  page.should have_content(@project.skills_needed)
  page.should have_content(@project.city)
  @project.tag_list.each do |tag|
    page.should have_content(tag)
  end
end

Then(/^I can see a link to add owners$/) do
  page.should have_link('Add & remove owners')
end

Then(/^my project should be deleted$/) do
  Project.all.include?(@project).should eq(false)
end
