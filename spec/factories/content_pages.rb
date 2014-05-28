FactoryGirl.define do
  factory :content_page do
    title "Page title"
    subtitle "Page subtitle"
    text "Lots of text here"
    link_text "MyText link"
    sequence(:url) { |n| "url-#{n}" }
  end
end
