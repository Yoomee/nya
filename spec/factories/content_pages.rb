FactoryGirl.define do
  factory :content_page do
    title "MyString"
    subtitle "MyString"
    text "MyText"
    slug "MyString#{Time.now.to_s}"
  end
end
