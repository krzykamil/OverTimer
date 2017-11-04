FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Content of a Rationale"
    overtime_request 2.5
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some other stuff"
    overtime_request 3.5
  end

  factory :another_user_post, class: "Post" do
    date Date.yesterday
    rationale "Some very other stuff"
    overtime_request 4.5
  end
end
