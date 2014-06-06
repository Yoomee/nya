Given(/^(\d+) projects far away$/) do |x|
  @far_projects = create_list(:project, x.to_i, city: 'London')
  # override geocoded coords from webmock (that are set to York)
  @far_projects.each do |p|
    p.longitude = 51.50722
    p.latitude = 0.12750
    p.save(validate: false)
  end
end
