FactoryGirl.define do
  factory :blog_post do
    sequence(:title) { |n| "Blog title #{n}" }
    sequence(:subtitle) { |n| "Blog subtitle #{n}" }
    sequence(:text) { |n| "Blog text #{n}" }
  end
end
