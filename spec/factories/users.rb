FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    sequence(:email) { |n| "user_#{n}@yoomee.com" }
    password 'password'
    role ''
  end
end
