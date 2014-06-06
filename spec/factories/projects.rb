# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence(:title) { |n| "Example project title#{n}" }
    description "Example project description"
    latitude 53.95996510000001
    longitude -1.0872979
    city 'York'
    image_uid "MyString"
    image_name "MyString"
    user
    project_category
    help_needed "Example help needed text"
    purpose "Example purpose text"
    deadline "2014-05-22"
    tag_list "breakdancing, micropayments, app"
  end
end
