# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_category do
    sequence(:name) { |n| "name-#{n}" }
    sequence(:slug) { |n| "slug-#{n}" }
    description "Category description"
  end
end
