FactoryGirl.define do
  factory :post do
    sequence(:text) { |n| "post text #{n}"}
    user
  end
end
