FactoryGirl.define do
  factory :post do
    date Date.today
    work_performed "Content of a work_performed"
    daily_hours 2.5
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    work_performed "Some other stuff"
    daily_hours 3.5
  end

  factory :another_user_post, class: "Post" do
    date Date.yesterday
    work_performed "Some very other stuff"
    daily_hours 4.5
  end
end
