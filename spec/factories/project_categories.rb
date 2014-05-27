# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_category do
    name "Art"
    sequence(:slug) { |n| "slug-#{n}" }
    description "Category description"
  end
end
