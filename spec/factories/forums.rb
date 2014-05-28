# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :forum do
    sequence(:name) { |n| "Dance-#{n}" }
    description 'Talk about your sport & leisure project here. Share ideas, give encouragement and help each other.'
  end
end
