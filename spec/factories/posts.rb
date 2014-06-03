FactoryGirl.define do
  factory :post do
    sequence(:text) { |n| "post text #{n}"}
    user
  end

  factory :project_blog, class: Post do
    sequence(:text) { |n| "post text #{n}"}
    user
    context 'project_blog'
  end

  factory :project_comment, class: Post do
    sequence(:text) { |n| "post text #{n}"}
    user
    context 'project_comment'
  end
end
