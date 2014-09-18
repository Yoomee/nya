# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence(:title) { |n| "Example project title#{n}" }
    inspiration "Example project inspiration"
    who_helping 'who helping'
    how_helping 'how helping'
    latitude 53.95996510000001
    longitude -1.0872979
    city 'York'
    image_uid "MyString"
    image_name "MyString"
    user
    project_category
    step1 'step 1'
    skills_have "Example skills have text"
    skills_needed "Example skills needed text"
    deadline "2014-05-22"
    tag_list "breakdancing, micropayments, app"
  end
end
