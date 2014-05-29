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

When(/^I press the 'Show more' link$/) do
  click_link 'Show more'
  wait_for_ajax
  # Timeout.timeout(Capybara.default_wait_time) do
  #   loop until page.evaluate_script('jQuery.active').zero?
  # end
end

Then(/^there are (\d+) projects on the page$/) do |num|
  page.all("div.project-card").count.should eql(num.to_i)
end
