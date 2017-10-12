FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Content of a Rationale"
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some other stuff"
  end

  factory :another_user_post, class: "Post" do
    date Date.yesterday
    rationale "Some very other stuff"
  end
end
