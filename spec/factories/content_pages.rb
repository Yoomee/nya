FactoryGirl.define do
  factory :content_page do
    title "MyString"
    subtitle "MyString"
    text "MyText"
    sequence(:slug) { |n| "slug-#{n}" }
  end
end
