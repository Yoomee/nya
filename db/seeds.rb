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
    ProjectCategory.create(
      name: "Art",
      slug: "art",
      description: "Example category description"
    )
    ProjectCategory.create(
      name: "Music",
      slug: "music",
      description: "Example category description"
    )
    Project.create(
      title: "Example project title",
      description: "Example project description",
      latitude: 1.5,
      longitude: 1.5,
      city: 'Sheffield',
      user: User.find_by(email: 'david@yoomee.com'),
      project_category: ProjectCategory.first,
      help_needed: "Example help needed text",
      purpose: "Example purpose text",
      deadline: "2014-10-22"
    )

end
