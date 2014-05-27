# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "Example project title"
    description "Example project description"
    latitude 1.5
    longitude 1.5
    city 'York'
    image_uid "MyString"
    image_name "MyString"
    user
    project_category
    help_needed "Example help needed text"
    purpose "Example purpose text"
    deadline "2014-05-22"
  end
end
