FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email { "user_#{rand(1000).to_s}@yoomee.com" }
    password 'password'
    role ''
  end
end
