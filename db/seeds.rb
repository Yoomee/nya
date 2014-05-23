# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
DEFAULT_USERS   = [
  {
    :first_name => 'Rich',
    :last_name  => 'Wells',
    :email      => 'rich@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Ian',
    :last_name  => 'Mooney',
    :email      => 'ian@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Matt',
    :last_name  => 'Atkins',
    :email      => 'matt@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Andy',
    :last_name  => 'Mayer',
    :email      => 'andy@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Nicola',
    :last_name  => 'Mayer',
    :email      => 'nicola@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Edward',
    :last_name  => 'Andrews',
    :email      => 'edward@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'David',
    :last_name  => 'Thompson',
    :email      => 'david@yoomee.com',
    :role       => 'admin'
  }
]

if (User.count == 0)
  DEFAULT_USERS.each do |user_attrs|
    user = User.new(user_attrs)
    user.encrypted_password = "$2a$10$0I7i6.g2JMYLoLzYpAZPcujZpGhQ/oJ41RaaMm.8Ff.1k9thCALIm"
    user.save(:validate => false)
  end
end

# project seed data
case Rails.env
  when "development"
    Project.create(
      title: "Example project title",
      description: "Example project description",
      latitude: 1.5,
      longitude: 1.5,
      city: 'Sheffield',
      image_uid: "MyString",
      image_name: "MyString",
      user: User.find_by(email: 'david@yoomee.com'),
      help_needed: "Example help needed text",
      purpose: "Example purpose text",
      deadline: "2014-10-22"
    )
end

ContentPage.create(title: 'What is the NYA social action tool?', link_text: 'About', subtitle: 'NYA social action tool is helps young people get their ideas up and running into socially engaging projects.', slug: 'about') unless ContentPage.find_by_slug('about').present?
ContentPage.create(title: 'Contact Us', link_text: 'Contact', subtitle: 'Get in touch', slug: 'contact') unless ContentPage.find_by_slug('contact').present?
ContentPage.create(title: 'FAQ', link_text: 'FAQ', subtitle: %q(Browse our list of common frequently asked questions below. If it's not there, don't hesitate to <a href="contact">drop us a line</a>, and you'll get instant feedback!), slug: 'faq') unless ContentPage.find_by_slug('fay').present?
