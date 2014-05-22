# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "Example project title"
    description "Example project description"
    lat 1.5
    lng 1.5
    image_uid "MyString"
    image_name "MyString"
    user
    help_needed "Example help needed text"
    purpose "Example purpose text"
    deadline "2014-05-22 13:59:18"
  end
end
