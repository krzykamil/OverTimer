FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Content of a Rationale"
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some other stuff"
  end
end
