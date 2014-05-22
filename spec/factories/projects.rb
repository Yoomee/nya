# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "MyString"
    description "MyText"
    lat 1.5
    lng 1.5
    image_uid "MyString"
    image_name "MyString"
    user nil
    help_needed "MyText"
    purpose "MyText"
    deadline "2014-05-22 13:59:18"
  end
end
